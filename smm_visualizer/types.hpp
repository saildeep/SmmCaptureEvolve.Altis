class TasksManager:OOType{
    isSingleton = 1;
    singletonParams = "[]";
    class AddTask:OOFunction{
        file="smm_visualizer\TasksManager\AddTask.sqf";
    };
    class DeleteTask:OOFunction{
        file="smm_visualizer\TasksManager\DeleteTask.sqf";
    };
};