import 'package:get/get.dart';
import 'package:todoapp/pages/add_note_screen.dart';
import 'package:todoapp/pages/add_task_srcreen.dart';
import 'package:todoapp/pages/home_screen.dart';
import 'package:todoapp/pages/show_archives_screen.dart';
import 'package:todoapp/pages/show_notes_screen.dart';
import 'package:todoapp/pages/show_tasks_screen.dart';

class Routes {
  static List<GetPage> get getPages => [
        GetPage(name: '/home', page: () => const HomeScreen()),
        GetPage(name: '/addtask', page: () => const AddTaskScreen()),
        GetPage(name: '/addnote', page: () => const AddNoteScreen()),
        GetPage(name: '/tasks', page: () => const ShowTasksScreen()),
        GetPage(name: '/notes', page: () => const ShowNotesScreen()),
        GetPage(name: '/archives', page: () => const ShowArchivesScreen()),
      ];
}
