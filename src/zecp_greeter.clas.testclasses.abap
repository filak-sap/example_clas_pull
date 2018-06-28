*"* use this source file for your ABAP unit test classes
class mock_impl definition
  inheriting from impl
  create private.

  public section.

    class-methods install.

    methods user_name redefinition.

endclass.

class mock_impl implementation.

  method install.
    data(instance) = new mock_impl( ).
    instance->set_singleton( instance ).
  endmethod.

  method user_name.
    username = 'Foo'.
  endmethod.

endclass.


class build_greeting_test definition
  for testing
  risk level harmless
  duration short.

  private section.

    methods salutation_and_username
      for testing.

endclass.

class build_greeting_test implementation.

  method salutation_and_username.
    mock_impl=>install( ).

    data(greeter) = new zecp_greeter( 'Ohai' ).

    data(greeting) = greeter->build_greeting( ).
    cl_abap_unit_assert=>assert_equals(
      act = greeting
      exp = 'Ohai Foo!'
    ).
  endmethod.

endclass.
