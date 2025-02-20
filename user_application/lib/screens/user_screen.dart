import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/user_service.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final UserService userService = UserService();
  late Future<List<User>> futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = userService.fetchUsers();
  }

  void _showEditDialog(User user) {
    final _formKey = GlobalKey<FormState>();

    TextEditingController firstNameController = TextEditingController(text: user.firstName);
    TextEditingController lastNameController = TextEditingController(text: user.lastName);
    TextEditingController emailController = TextEditingController(text: user.email);
    TextEditingController phoneNumberController = TextEditingController(text: user.phoneNumber);
    TextEditingController zipCodeController = TextEditingController(text: user.zipCode);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Create User"),
          content: Form(
            key: _formKey, // Thêm Form để quản lý validation
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: firstNameController,
                  decoration: InputDecoration(labelText: "First Name"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "First name must not be empty";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: lastNameController,
                  decoration: InputDecoration(labelText: "Last Name"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Last name must not be empty";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: "Email"),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email must not be empty";
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return "Invalid email format";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: phoneNumberController,
                  decoration: InputDecoration(labelText: "Phone number"),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (!RegExp(r'^\d{10}$').hasMatch(value!)) {
                      return "Phone number must be 10 digits";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: zipCodeController,
                  decoration: InputDecoration(labelText: "Zip code"),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  try {
                    User updateUser = User(
                      id : user.id,
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                      email: emailController.text,
                      phoneNumber: phoneNumberController.text,
                      zipCode: zipCodeController.text,
                    );

                    await userService.updateUser(updateUser);

                    setState(() {
                      futureUsers = userService.fetchUsers();
                    });

                    Navigator.pop(context);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(e.toString()), // Hiển thị lỗi từ API
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                }
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteDialog(User user) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("Confirm Delete"),
            content: Text(
              "Are you sure you want to delete ${user.firstName} ${user.lastName}?",
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _execDelete(user);
                },
                child: Text("Delete", style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
    );
  }

  void _execDelete(User user) async {
    await userService.deleteUser(user);
    setState(() {
      futureUsers = userService.fetchUsers();
    });
  }

  void _showCreateDialog() {
    final _formKey = GlobalKey<FormState>();

    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController zipCodeController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Create User"),
          content: Form(
            key: _formKey, // Thêm Form để quản lý validation
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: firstNameController,
                  decoration: InputDecoration(labelText: "First Name"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "First name must not be empty";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: lastNameController,
                  decoration: InputDecoration(labelText: "Last Name"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Last name must not be empty";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: "Email"),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email must not be empty";
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return "Invalid email format";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: phoneNumberController,
                  decoration: InputDecoration(labelText: "Phone number"),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (!RegExp(r'^\d{10}$').hasMatch(value!)) {
                      return "Phone number must be 10 digits";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: zipCodeController,
                  decoration: InputDecoration(labelText: "Zip code"),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  try {
                    User newUser = User(
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                      email: emailController.text,
                      phoneNumber: phoneNumberController.text,
                      zipCode: zipCodeController.text,
                    );

                    await userService.createUser(newUser);

                    setState(() {
                      futureUsers = userService.fetchUsers();
                    });

                    Navigator.pop(context);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(e.toString()), // Hiển thị lỗi từ API
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                }
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User List"),
        actions: [
          ElevatedButton(
            onPressed: () {
              _showCreateDialog();
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              backgroundColor: Colors.blue,
            ),
            child: Text("Create User", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: FutureBuilder<List<User>>(
        future: futureUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No users found"));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final user = snapshot.data![index];
              return ListTile(
                title: Text("${user.firstName} ${user.lastName}"),
                subtitle: Text(user.email),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        _showEditDialog(user);
                      },
                      icon: Icon(Icons.edit, color: Colors.blue),
                    ),
                    IconButton(
                      onPressed: () {
                        _showDeleteDialog(user);
                      },
                      icon: Icon(Icons.delete, color: Colors.blue),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
