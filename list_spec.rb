require "rspec"

require_relative "list"

describe List do
  let(:title) { "todo at the serengeti" }
  let(:task1) { mock(:task, :description => "walk the lion", :complete => false) }
  let(:task2) { mock(:task, :descripttion => "go on safari", :complete => true) }
  let(:task3) { mock(:task, :descripttion => "watch the rhinos", :complete => false) }
  let(:wrong_argument) { mock(:task) }
  let(:list)  { List.new(title, [task1,task2]) }

  describe "#initialize" do 
    it "should take 2 arguments" do
      expect { List.new }.to raise_error(ArgumentError)
    end

    it "should have a title" do
        expect(list.title).to_not be_nil
    end

    context "checking task inputs" do
      it "should have an array of tasks" do
        expect(list.tasks).to eq([task1,task2])
      end
      it "raises error when input is not an array" do
        expect { List.new(title, wrong_argument) }.to raise_error(TypeError)
      end
    end
  end

  describe "#add_task" do 
    it "increases the task list by 1" do
      expect(list.add_task(task3)).to eq([task1,task2,task3])
    end
  end  

  describe "#complete_task" do 
    it "changes complete from false to true" do
      task1.should_receive(:complete!)
      list.complete_task(0)
    end
  end 

  describe "#delete_task" do
    it "delete task from list" do
      list.tasks.should_receive(:delete_at)
      list.delete_task(0)
    end
  end 

  describe "#completed_tasks" do
    it "should return 1 completed task from the 2 tasks" do 
      task1.should_receive(:complete?).and_return(false)
      task2.should_receive(:complete?).and_return(true)
      expect(list.completed_tasks).to eq([task2])
    end
  end 

  describe "#incomplete_tasks" do 
    it "should return 1 incomplete task from the 2 tasks" do 
      task1.should_receive(:complete?).and_return(false)
      task2.should_receive(:complete?).and_return(true)
      expect(list.incomplete_tasks).to eq([task1])
    end
  end 

end
