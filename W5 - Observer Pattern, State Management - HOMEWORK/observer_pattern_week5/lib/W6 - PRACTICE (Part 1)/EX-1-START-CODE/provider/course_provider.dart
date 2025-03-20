import 'package:flutter/foundation.dart';
import '../models/course.dart';
import '../repositories/courses_repository.dart';

class CourseProvider with ChangeNotifier {
  final CoursesRepository _coursesRepository;

  CourseProvider(this._coursesRepository);

  Course getCourseFor(String courseId) {
    return _coursesRepository
        .getCourses()
        .firstWhere((course) => course.id == courseId);
  }

  List<Course> get courses => _coursesRepository.getCourses();

  void addScore(Course course, CourseScore score) {
    _coursesRepository.addScore(course, score);
    notifyListeners();
  }
}
