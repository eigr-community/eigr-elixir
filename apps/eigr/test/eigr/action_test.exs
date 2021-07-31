defmodule ActionTest do
  use ExUnit.Case

  test "Unary call" do
    test_action = ActionEntityUnaryTest.new(context: %{})

    assert {:reply, %Pong{name: "Anakin Skywalker"}} =
             Eigr.Action.Unary.handle_unary(test_action, %Ping{name: "Anakin Skywalker"})
  end

  test "Response SideEffects" do
    test_action = ActionEntityUnaryTest.new(context: %{})

    assert {:reply, %Ping{name: "Pong"},
            %Eigr.SideEffect{service_name: "test_service", command_name: "echo"}} =
             Eigr.Action.Unary.handle_unary(test_action, %Pong{})
  end
end
