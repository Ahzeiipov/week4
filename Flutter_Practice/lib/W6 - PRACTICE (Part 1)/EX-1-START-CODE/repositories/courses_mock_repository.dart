import '../models/course.dart';
import 'courses_repository.dart';

class CoursesMockRepository extends CoursesRepository {
  final List<Course> _courses = [
    Course(name: 'HTML' , id: '1'),
    Course(name: 'JAVA' , id: '2'),
  ];

  @override
  List<Course> getCourses() => _courses;  

  @override

  void addScore(Course course, CourseScore score){
    course.addScore(score);
  }
}
