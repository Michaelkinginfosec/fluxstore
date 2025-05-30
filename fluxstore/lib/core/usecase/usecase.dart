abstract class Usecase<Type, Params> {
  Future<Type> call({required Params param});
}

abstract class NoParams {}

// class CreateTaskUsecase implements Usecase<void, TaskEntity> {
//   final TaskRepository taskRepository;

//   CreateTaskUsecase(this.taskRepository);

//   @override
//   Future<void> call({required TaskEntity param}) async {
//     await taskRepository.addTask(param);
//   }
// }
