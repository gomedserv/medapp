import 'package:flutter/material.dart';
import 'package:gomedserv/home/dashboard_screen.dart';
import 'package:gomedserv/booking_management/add_commission.dart';
import 'package:gomedserv/service_management/add_service.dart';
import 'package:gomedserv/user_management/manageusers_screen.dart';
import 'package:gomedserv/widgets/topbar.dart';

class BookingManagement extends StatefulWidget {
  const BookingManagement({super.key});

  @override
  State<BookingManagement> createState() => _BookingManagementState();
}

class _BookingManagementState extends State<BookingManagement> {
  @override
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredUsers = usersData
        .where((user) =>
            user.username?.toLowerCase().contains(searchQuery.toLowerCase()) ??
            false ||
                // user.email?.toLowerCase().contains(searchQuery.toLowerCase()) ??
                false)
        .toList();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              TopBar(
                title: 'Booking Management',
                onBackPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 5),
              _buildSearchBar(),
              SizedBox(height: 2), // Space between search bar and row
              _buildUserListRow(context),
              if (filteredUsers.isEmpty)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'No users found.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                )
              else
                _buildUserList(filteredUsers),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: 0,
          onTap: (index) {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  Widget _buildUserListRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          const Text(
            'Booking Overview',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddCommission(),
                ),
              );
            },
            child: const Text(
              "Commissions",
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const SizedBox(width: 5), // Add some spacing between the buttons
          GestureDetector(
            onTap: () {},
            child: const Text(
              "Reschedule",
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const SizedBox(width: 5), // Add some spacing between the buttons
          GestureDetector(
            onTap: () {},
            child: const Text(
              "Cancel",
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        onChanged: (query) {
          setState(() {
            searchQuery = query;
          });
        },
        decoration: InputDecoration(
          hintText: 'Search by username or email',
          suffixIcon: const Icon(
            Icons.search,
            size: 25,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  Widget _buildUserList(List<User> users) {
    return Container(
      height: 500, // Adjust the height as per your need
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 12.0),
            child: ListTile(
              title: Text(
                "${user.username ?? "No Name"}",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${user.email ?? "No Email"}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    "${user.date ?? "No Date"}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "${user.status ?? "Active"}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color:
                          user.status == 'Active' ? Colors.green : Colors.red,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddCommission()),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
