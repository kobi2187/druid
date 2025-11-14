import jnim

jclass android.app.DatePickerDialog* of AlertDialog:
  proc onDateChanged*(view: DatePicker, year: jint, month: jint, dayOfMonth: jint)
  proc setOnDateSetListener*(listener: OnDateSetListener)
  proc onClick*(dialog: DialogInterface, which: jint)
  proc getDatePicker*(): DatePicker
  proc updateDate*(year: jint, month: jint, dayOfMonth: jint)
  proc onSaveInstanceState*(): Bundle
  proc onRestoreInstanceState*(savedInstanceState: Bundle)

