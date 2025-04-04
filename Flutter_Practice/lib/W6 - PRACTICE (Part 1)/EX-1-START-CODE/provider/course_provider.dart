import 'package:flutter/foundation.dart';
import '../models/course.dart';
import '../repositories/courses_repository.dart';

class CourseProvider with ChangeNotifier {
  final CoursesRepository coursesRepository;

  CourseProvider(this.coursesRepository);

  Course getCourseFor(String courseId) {
    return coursesRepository
        .getCourses()
        .firstWhere((course) => course.id == courseId);
  }

  List<Course> get courses => coursesRepository.getCourses();

  void addScore(Course course, CourseScore score) {
    coursesRepository.addScore(course, score);
    notifyListeners();
  }
}
