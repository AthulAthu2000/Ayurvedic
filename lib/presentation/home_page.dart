// presentation/pages/home_page.dart

import 'package:ayurvedic_centre/domain/provider/auth_provider.dart';
import 'package:ayurvedic_centre/domain/provider/patient_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Fetch data when the page is first loaded
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final patientProvider = Provider.of<PatientProvider>(context, listen: false);
    patientProvider.fetchPatients();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Log out the user and navigate to the login page
              // You can add logout logic to your AuthProvider
            },
          ),
        ],
      ),
      body: Consumer<PatientProvider>(
        builder: (context, patientProvider, child) {
          // Handle loading state
          if (patientProvider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // Handle error state
          if (patientProvider.errorMessage != null) {
            return Center(
              child: Text(patientProvider.errorMessage!),
            );
          }

          // Handle empty list state
          if (patientProvider.patients == null || patientProvider.patients!.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // You should use your actual empty list image widget here
                  Icon(Icons.list, size: 100, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('No patients found.'),
                ],
              ),
            );
          }

          // Handle data loaded state
          return RefreshIndicator(
            onRefresh: patientProvider.fetchPatients, // The pull-to-refresh function
            child: ListView.builder(
              itemCount: patientProvider.patients!.length,
              itemBuilder: (context, index) {
                final patient = patientProvider.patients![index];
                return ListTile(
                  title: Text(patient['name']), // Assuming the JSON has a 'name' field
                  subtitle: Text(patient['phone']), // Assuming a 'phone' field
                );
              },
            ),
          );
        },
      ),
    );
  }
}