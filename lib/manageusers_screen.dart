import 'package:flutter/material.dart';
import 'package:gomedserv/dashboard_screen.dart';
import 'package:gomedserv/user_profile.dart';

class User {
  final String id;
  final String? profilePic;
  final String? username;
  final String? email;
  final String? date;
  final String? status;

  User({
    required this.id,
    this.profilePic,
    this.username,
    this.email,
    this.date,
    this.status,
  });
}

final List<User> usersData = [
  User(
      id: '1',
      profilePic: 'assets/images/avatar1.png',
      username: 'John Doe',
      email: 'john@example.com',
      date: '24/02/2024',
      status: 'Active'),
  User(
      id: '2',
      profilePic: 'assets/images/avatar2.png',
      username: 'Jane Smith',
      email: 'jane@example.com',
      date: '19/02/2024',
      status: 'Deactive'),
  User(
      id: '3',
      profilePic: 'assets/images/avatar1.png',
      username: 'John Doe',
      email: 'john@example.com',
      date: '24/02/2024',
      status: 'Active'),
  User(
      id: '4',
      profilePic: 'assets/images/avatar2.png',
      username: 'Jane Smith',
      email: 'jane@example.com',
      date: '19/02/2024',
      status: 'Deactive'),
  User(
      id: '5',
      profilePic: 'assets/images/avatar1.png',
      username: 'John Doe',
      email: 'john@example.com',
      date: '24/02/2024',
      status: 'Active'),
  User(
      id: '6',
      profilePic: 'assets/images/avatar2.png',
      username: 'Jane Smith',
      email: 'jane@example.com',
      date: '19/02/2024',
      status: 'Deactive'),
  User(
      id: '7',
      profilePic: 'assets/images/avatar2.png',
      username: 'Jane Smith',
      email: 'jane@example.com',
      date: '19/02/2024',
      status: 'Deactive'),
  User(
      id: '8',
      profilePic: 'assets/images/avatar2.png',
      username: 'Last edhe',
      email: 'jane@example.com',
      date: '19/02/2024',
      status: 'Deactive'),
];

class ManageUsersScreen extends StatefulWidget {
  @override
  _ManageUsersScreenState createState() => _ManageUsersScreenState();
}

class _ManageUsersScreenState extends State<ManageUsersScreen> {
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
              _buildTopBar(context),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Users List',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: () {
              // Implement deactivate functionality
            },
            child: const Text(
              'Deactivate',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: const BoxDecoration(
        color: Color(0xFFD2F1E4),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 28,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Text(
                  'Manage Users',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            IconButton(
              icon: const Icon(
                Icons.notifications,
                size: 28,
              ),
              onPressed: () {
                // Handle notification button press
              },
            ),
          ],
        ),
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
    return ListView.builder(
      shrinkWrap: true,
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
            trailing: Container(
              child: Column(
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
                  // IconButton(
                  //   icon: const Icon(
                  //     Icons.edit,
                  //   ),
                  //   onPressed: () {},
                  // ),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UserProfileScreen(
                          user: user,
                        )),
              );
            },
          ),
        );
      },
    );
  }
}
