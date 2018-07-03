class zecp_greeter definition public final create public .

  public section.

    methods constructor
      importing
        salutation type string.

    methods build_greeting
      returning
        value(greeting) type string.

  private section.

    data: salutation type string.

endclass.



class zecp_greeter implementation.

  method constructor.
    me->salutation = salutation.
  endmethod.

  method build_greeting.
    greeting = |{ me->salutation } { sy-uname }!|.
  endmethod.

endclass.
