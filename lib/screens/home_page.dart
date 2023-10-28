import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:user_list/provider/uselist_provider.dart';
import 'package:user_list/screens/user_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UserProvider>(context, listen: false).getAllTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider API'),
      ),
      body: Consumer<UserProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final users = value.user;

          if (users.isEmpty) {
          
            return const Center(
              child: Text('No Users available.'),
            );
          }

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                leading: InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>
                UserDetails(userId: users[index].userId!,
                 id: users[index].id!, title: users[index].title!, body: users[index].body!)));},
                  child: CircleAvatar(
                    child: Text(user.id.toString()),
                  ),
                ),
                title: Text(
                  user.title!,
                  style: TextStyle(
                    color:  Colors.black,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
