import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_scutum_test/core/constants/category_enum.dart';
import 'package:space_scutum_test/features/task_list/business/entities/task_entity.dart';
import 'package:space_scutum_test/features/task_list/business/usecases/load_tasks.dart';
import 'package:space_scutum_test/features/task_list/business/usecases/save_tasks.dart';
import 'package:space_scutum_test/features/task_list/data/datasources/task_list_local_data_source.dart';
import 'package:space_scutum_test/features/task_list/data/repositories/task_list_repository_impl.dart';
import 'package:uuid/uuid.dart';

part 'task_list_event.dart';
part 'task_list_state.dart';

class TaskListBloc extends Bloc<TaskListEvent, TaskListState> {
  // final _localStorage = TaskListRepositoryImpl();

  TaskListBloc() : super(TaskListLoading()) {
    on<LoadTasks>(
      (event, emit) async {
        try {
          final loadedTasks = await LoadTasksUseCase(
            taskListRepository: TaskListRepositoryImpl(
              localDataSource: TaskListLocalDataSourceImpl(
                sharedPreferences: await SharedPreferences.getInstance(),
              ),
            ),
          ).call();

          emit(TaskListLoaded(taskList: loadedTasks));
        } catch (error) {
          emit(TaskListError(error: error.toString()));
        }
      },
    );

    on<AddTask>(
      (event, emit) async {
        try {
          final newTask = TaskEntity(
            id: const Uuid().v4(),
            title: event.title,
            description: event.description,
            completed: false,
            categoryEnum: event.categoryEnum
          );

          final taskListRepository = TaskListRepositoryImpl(
            localDataSource: TaskListLocalDataSourceImpl(
              sharedPreferences: await SharedPreferences.getInstance(),
            ),
          );

          // Convert tasks to TaskModels before saving
          final tasksToSave = (state as TaskListLoaded).taskList +
              [newTask].map((taskEntity) => taskEntity.toTaskModel()).toList();

          await SaveTasks(
            taskListRepository: TaskListRepositoryImpl(
              localDataSource: TaskListLocalDataSourceImpl(
                sharedPreferences: await SharedPreferences.getInstance(),
              ),
            ),
          ).call(
              tasks: tasksToSave
                  .map((taskEntity) => taskEntity.toTaskModel())
                  .toList());

          await taskListRepository.loadTasks();

          emit(TaskListLoaded(taskList: tasksToSave));
        } catch (error) {
          // Handle errors gracefully, e.g., emit a TodosError state
          emit(TaskListError(error: error.toString()));
        }
      },
    );
 
    on<RemoveTask>(
      (event, emit) async {
        final taskList = (state as TaskListLoaded)
            .taskList
            .where((todo) => todo.id != event.id)
            .toList();

        await SaveTasks(
          taskListRepository: TaskListRepositoryImpl(
            localDataSource: TaskListLocalDataSourceImpl(
              sharedPreferences: await SharedPreferences.getInstance(),
            ),
          ),
        ).call(
            tasks: taskList
                .map((taskEntity) => taskEntity.toTaskModel())
                .toList());

        emit(
          TaskListLoaded(taskList: taskList),
        );
      },
    );

    on<ToggleTaskCompletion>(
      (event, emit) async {
        final taskList = (state as TaskListLoaded)
            .taskList
            .map((todo) => todo.id == event.id
                ? todo.toTaskModel().copyWith(completed: !todo.completed)
                : todo)
            .toList();

        await SaveTasks(
          taskListRepository: TaskListRepositoryImpl(
            localDataSource: TaskListLocalDataSourceImpl(
              sharedPreferences: await SharedPreferences.getInstance(),
            ),
          ),
        ).call(
            tasks: taskList
                .map((taskEntity) => taskEntity.toTaskModel())
                .toList());

        emit(
          TaskListLoaded(taskList: taskList),
        );
      },
    );
  }
}
