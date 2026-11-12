import jnim

jclass android.app.TimePickerDialog* of AlertDialog:
  proc getTimePicker*(): TimePicker
  proc onTimeChanged*(view: TimePicker, hourOfDay: jint, minute: jint)
  proc show*()
  proc onClick*(dialog: DialogInterface, which: jint)
  proc updateTime*(hourOfDay: jint, minuteOfHour: jint)
  proc onSaveInstanceState*(): Bundle
  proc onRestoreInstanceState*(savedInstanceState: Bundle)

