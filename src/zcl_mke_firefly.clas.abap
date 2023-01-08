CLASS zcl_mke_firefly DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    METHODS constructor.

  PROTECTED SECTION.

  PRIVATE SECTION.
    TYPES command TYPE c LENGTH 1.

    TYPES field TYPE c LENGTH 1.

    TYPES: BEGIN OF screen_line,
             a TYPE field,
             b TYPE field,
             c TYPE field,
             d TYPE field,
             e TYPE field,
           END OF screen_line.

    TYPES complete_screen TYPE TABLE OF screen_line INITIAL SIZE 5.

    CONSTANTS: BEGIN OF commands,
                 north TYPE command VALUE 'N',
                 south TYPE command VALUE 'S',
                 east  TYPE command VALUE 'E',
                 west  TYPE command VALUE 'W',
                 move  TYPE command VALUE 'M',
               END OF commands.

    DATA screen TYPE complete_screen.
    DATA x TYPE i VALUE 3.
    DATA y TYPE i VALUE 3.
    DATA firefly TYPE c LENGTH 1 VALUE '0'.
    DATA console TYPE REF TO  if_oo_adt_classrun_out .

    METHODS update_screen
      IMPORTING
        step    TYPE i
        command TYPE string.

ENDCLASS.



CLASS zcl_mke_firefly IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA commands_input TYPE string VALUE '1SS2S3W2E4E'.

    console = out.
    console->write( |Commands: { commands_input }| ).

    DATA(steps) = strlen( commands_input ).
    DO steps TIMES.
      DATA(command) = to_upper( commands_input+0(1) ).
      commands_input = shift_left( val = commands_input
                                   places = 1 ).

      CASE command.
        WHEN commands-north.
          y = y - 1.
          IF y < 1.
            y = 5.
          ENDIF.

        WHEN commands-south.
          y = y + 1.
          IF y > 5.
            y = 1.
          ENDIF.

        WHEN commands-west.
          x = x - 1.
          IF x < 1.
            x = 5.
          ENDIF.

        WHEN commands-east.
          x = x + 1.
          IF x > 5.
            x = 1.
          ENDIF.

        WHEN OTHERS.
          IF command CA '0123456789'.
            firefly = command.
          ELSEIF command = commands-move.
            firefly = '"'.
          ENDIF.
      ENDCASE.

      IF command = commands-north OR command = commands-south OR
         command = commands-east OR command = commands-west.
        update_screen( step    = sy-index
                       command = command ).
      ENDIF.
    ENDDO.

  ENDMETHOD.

  METHOD update_screen.
    ASSIGN screen[ y ] TO FIELD-SYMBOL(<line>).
    CASE x.
      WHEN 1.
        <line>-a = firefly.
      WHEN 2.
        <line>-b = firefly.
      WHEN 3.
        <line>-c = firefly.
      WHEN 4.
        <line>-d = firefly.
      WHEN 5.
        <line>-e = firefly.
    ENDCASE.

    console->write( data = screen
                    name = |Step: { sy-index }, Command: { command }| ).
  ENDMETHOD.

  METHOD constructor.
    screen = VALUE #( FOR i = 1 UNTIL i > 5 (  a = '"' b = '"' c = '"' d = '"' e = '"' ) ).
  ENDMETHOD.

ENDCLASS.
