class List
  attr_reader :title, :tasks

  def initialize(title, tasks = [])
    if tasks.class != Array 
      raise TypeError, "Tasks has to be an array of tasks!"
    end
    @title = title
    @tasks = tasks
  end

  def add_task(task)
    tasks << task
  end

  def complete_task(index)
    return false unless tasks[index]
    if tasks[index].complete!
      return true
    end
  end

  def delete_task(index)
    return false unless tasks[index]
    if tasks.delete_at(index)
      return true
    end
  end

  def completed_tasks
    tasks.select { |task| task.complete? }
  end

  def incomplete_tasks
    tasks.select { |task| !task.complete? }
  end
end
