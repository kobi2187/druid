import jnim

jclass android.graphics.RuntimeShader* of Shader:
  proc setWorkingColorSpace*(colorSpace: ColorSpace)
  proc setColorUniform*(uniformName: string, color: jint)
  proc setColorUniform*(uniformName: string, color: jlong)
  proc setColorUniform*(uniformName: string, color: Color)
  proc setFloatUniform*(uniformName: string, value: jfloat)
  proc setFloatUniform*(uniformName: string, value1: jfloat, value2: jfloat)
  proc setFloatUniform*(uniformName: string, value1: jfloat, value2: jfloat, value3: jfloat)
  proc setFloatUniform*(uniformName: string, value1: jfloat, value2: jfloat, value3: jfloat, value4: jfloat)
  proc setFloatUniform*(uniformName: string, values: seq[jfloat])
  proc setIntUniform*(uniformName: string, value: jint)
  proc setIntUniform*(uniformName: string, value1: jint, value2: jint)
  proc setIntUniform*(uniformName: string, value1: jint, value2: jint, value3: jint)
  proc setIntUniform*(uniformName: string, value1: jint, value2: jint, value3: jint, value4: jint)
  proc setIntUniform*(uniformName: string, values: seq[jint])
  proc setInputShader*(shaderName: string, shader: Shader)
  proc setInputBuffer*(shaderName: string, shader: BitmapShader)
  proc setInputColorFilter*(filterName: string, colorFilter: ColorFilter)
  proc setInputXfermode*(xfermodeName: string, xfermode: RuntimeXfermode)

