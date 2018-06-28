*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
class impl definition.

  public section.

    class-methods instance
      returning value(instance) type ref to impl.

    methods user_name
      returning value(username) type string.

  protected section.

    class-methods set_singleton
      importing
        newinstance type ref to impl
      returning value(retinstance) type ref to impl.

  private section.

    class-data:
      singleton type ref to impl.

endclass.

class impl implementation.

  method instance.
    if not singleton is bound.
      instance = set_singleton( new impl( ) ).
    else.
      instance = singleton.
    endif.
  endmethod.

  method set_singleton.
    retinstance = impl=>singleton = newinstance.
  endmethod.

  method user_name.
    username = sy-uname.
  endmethod.

endclass.
