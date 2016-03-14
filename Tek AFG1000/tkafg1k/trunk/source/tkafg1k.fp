s��        	�   { �Z  C�   �   ����                               tkafg1k                         Tektronix AFG 1000 Function Generator                                                                 � � ��ViInt16  �  � ��ViInt32  � � ��ViReal64     � ��ViRsrc     	� 	��ViBoolean     	� 	��ViSession     � ��ViStatus     �  ViChar[]     � ��ViChar     � ��ViString     	�  ViInt16[]     	�  ViInt32[]     
�  	ViReal64[]     � 	 
ViBoolean[]     � ��ViConstString     � ��ViAttr     �  ViByte[]     � ��ViInt64  �    This instrument driver provides programming support for the Tektronics AFG3000 Series FGen.  The driver contains all the functions that IVI and VXIplug&play require.  In addition, the driver contains high-level functions that configure the function generator and produce an output signal in a single operation.  The driver also contains lower level functions that configure and initiate signal generation in separate operations.   

Note:  This driver requires the VISA and IVI libraries.  

    �    This class contains functions and sub-classes that configure the function generator.  The class contains high-level functions that configure standard waveform generation, arbitrary waveform generation, arbitrary sequence generation, triggering, amplitude modulation, and frequency modulation.  The class also contains the low-level functions that set, get, and check individual attribute values.
    �    This class contains functions that configure the function generator to produce standard waveform output.  These periodic signals are characterized by their waveform, amplitude, DC offset, frequency, and start phase.  Some waveforms may require additional parameters to characterize their output.  For example, a square wave requires a duty cycle parameter in addition to those parameters listed above.
    R    This class contains functions that configure the function generator to produce arbitrary waveform and sequence output, create arbitrary waveforms and sequences, and clear arbitrary waveforms and sequences.  

An arbitrary waveform consists of a user-specified array of normalized data that function generator can produce.

An arbitrary sequence consists of multiple waveforms.  For each waveform, you specify the number of times the function generator produces the waveform before proceeding to the next waveform.  The number of times to repeat a specific waveform is called the loop count.

     �    This class contains functions that configure the function generator to produce arbitrary waveforms, create arbitrary waveforms, and clear arbitrary waveforms.     p    This class contains functions that create arbitrary waveforms with waveform data intialized in different ways.     Q    This class contains functions that configure the arbitrary waveform frequency.
     I    This class contains functions that configure the burst operation mode.
     r    This class contains functions that configure the function generator to add additional waveform to output signal.    �    This class contains functions that configure the modulating signal and apply amplitude modulation to a carrier signal.

Amplitude modulation produces an output signal by varying the amplitude of a carrier signal according to the amplitude of a modulating signal.  You specify the carrier signal with the functions in either the Standard Function Output class or the Arbitrary Waveform Output class.  The modulating signal can be an internally generated or an externally generated signal.

    �    This class contains functions that configure the modulating signal and apply frequency modulation to a carrier signal.

Frequency modulation produces an output signal by varying the frequency of a carrier signal according to the frequency of a modulating signal.  You specify the carrier signal with the functions in either the Standard Function Output class or the Arbitrary Waveform Output class.  The modulating signal can be an internally generated or an externally generated signal.

    U    This class contains functions that configure the modulating signal and apply phase modulation to a carrier signal.

You specify the carrier signal with the functions in either the Standard Function Output class or the Arbitrary Waveform Output class.  The modulating signal can be an internally generated or an externally generated signal.    P    This class contains functions that configure frequency shift key modulation and apply it to a carrier signal.

You specify the carrier signal with the functions in either the Standard Function Output class or the Arbitrary Waveform Output class.  The modulating signal can be an internally generated or an externally generated signal.        This class contains functions that configure the modulating signal and apply pulse width modulation to a carrier signal.

Pulse width modulation is only applicable to the pulse waveform.  The modulating signal can be an internally generated or an externally generated signal.     T    This class contains sub-classes for the set, get, and check attribute functions.       �    This class contains functions that set an attribute to a new value.  There are typesafe functions for each attribute data type.     �    This class contains functions that obtain the current value of an attribute.  There are typesafe functions for each attribute data type.     �    This class contains functions that obtain the current value of an attribute.  There are typesafe functions for each attribute data type.     j    This class contains functions and classes that initiate instrument operations and report their status.

    _    This class contains functions and sub-classes that control common instrument operations.  These functions include many of functions that VXIplug&play require, such as reset, self-test, revision query, error query, and error message.  This class also contains functions that access IVI error infomation, lock the session, and perform instrument I/O.
     R    This class contains functions that retrieve and clear the IVI error information.     ?    This class contains functions that retrieve coercion records.     J    This class contains functions that retrieve interchangeability warnings.     k    This class contains functions that lock and unlock IVI instrument driver sessions for multithread safefy.     F    This class contains functions that send and receive instrument data.     F    This class contains functions that send and receive instrument data.    L    This function performs the following initialization actions:

- Creates a new IVI instrument driver session.

- Opens a session to the specified device using the interface and address you specify for the Resource Name parameter.

- If the ID Query parameter is set to VI_TRUE, this function queries the instrument ID and checks if it is valid for this instrument driver.

- If the Reset parameter is set to VI_TRUE, this function resets the instrument to a known state.

- Sends initialization commands to set the instrument to the state necessary for the operation of the instrument driver.

- Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Note:  
(1) This function creates a new session each time you invoke it. Although you can open more than one IVI session for the same resource, it is better not to do so.  You can use the same session in multiple program threads.  You can use the tkafg1k_LockSession and tkafg1k_UnlockSession functions to protect sections of code that require exclusive access to the resource.
(2) Content from the IVI specifications reproduced with permission from the IVI Foundation. 
The IVI Foundation and its member companies make no warranty of any kind with regard to this material, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose. The IVI Foundation and its member companies shall not be liable for errors contained herein or for incidental or consequential damages in connection with the furnishing, performance, or use of this material.


        Passes the resource name of the device to initialize.

You can also pass the name of a virtual instrument or logical name that you configure with the IVI Configuration utility.  The virtual instrument identifies a specific device and specifies the initial settings for the session.  A logical Name identifies a particular virtual instrument.

Refer to the table below for the exact grammar to use for this parameter.  Optional fields are shown in square brackets ([]).

Syntax
------------------------------------------------------
GPIB[board]::<primary address>[::secondary address]::INSTR
VXI[board]::<logical address>::INSTR
GPIB-VXI[board]::<logical address>::INSTR
ASRL<port>::INSTR
<LogicalName>
<Driver Session>

If you do not specify a value for an optional field, the following values are used:

Optional Field - Value
------------------------------------------------------
board - 0
secondary address - none (31)

The following table contains example valid values for this parameter.

"Valid Value" - Description
------------------------------------------------------
"GPIB::22::INSTR" - GPIB board 0, primary address 22 no
                    secondary address
"GPIB::22::5::INSTR" - GPIB board 0, primary address 22
                       secondary address 5
"GPIB1::22::5::INSTR" - GPIB board 1, primary address 22
                        secondary address 5
"VXI::64::INSTR" - VXI board 0, logical address 64
"VXI1::64::INSTR" - VXI board 1, logical address 64
"GPIB-VXI::64::INSTR" - GPIB-VXI board 0, logical address 64
"GPIB-VXI1::64::INSTR" - GPIB-VXI board 1, logical address 64
"ASRL2::INSTR" - COM port 2
"SampleInstr" - Logical name "SampleInstr"
"xyz432" - Logical Name or Driver Session "xyz432"
-------------------------------------------------------
 
Default Value:  "GPIB::11::INSTR"
    �    Specifies whether you want the instrument driver to perform an ID Query.

Valid Range:
VI_TRUE  (1) - Perform ID Query (Default Value)
VI_FALSE (0) - Skip ID Query

When you set this parameter to VI_TRUE, the driver verifies that the instrument you initialize is a type that this driver supports.  

In some circumstances it is undesirable to send an ID Query command string to the instrument.  When you set this parameter to VI_FALSE, the function initializes the instrument without performing an ID Query.     �    Specifies whether you want to reset the instrument during the initialization procedure.

Valid Range:
VI_TRUE  (1) - Reset Device (Default Value)
VI_FALSE (0) - Don't Reset

    �    Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Notes:

(1) This function creates a new session each time you invoke it.  This is useful if you have multiple physical instances of the same type of instrument.  

(2) Avoid creating multiple concurrent sessions to the same physical instrument.  Although you can create more than one IVI session for the same resource, it is best not to do so.  A better approach is to use the same IVI session in multiple execution threads.  You can use functions tkafg1k_LockSession and tkafg1k_UnlockSession to protect sections of code that require exclusive access to the resource.

    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

    � >   �  �    Resource Name                     ' > �       ID Query                          ) >� �       Reset Device                      )� �j �  �    Instrument Handle                 ,�����  �    Status                          ����  p��                                            "GPIB::11::INSTR"   Yes VI_TRUE No VI_FALSE   Yes VI_TRUE No VI_FALSE    	           	           LCopyright 2005-2015, National Instruments Corporation. All Rights Reserved.   �    This function performs the following initialization actions:

- Creates a new IVI instrument driver and optionally sets the initial state of the following session attributes:

    TKAFG1K_ATTR_RANGE_CHECK         
    TKAFG1K_ATTR_QUERY_INSTRUMENT_STATUS  
    TKAFG1K_ATTR_CACHE               
    TKAFG1K_ATTR_SIMULATE            
    TKAFG1K_ATTR_RECORD_COERCIONS 
    TKAFG1K_ATTR_DRIVER_SETUP   

- Opens a session to the specified device using the interface and address you specify for the Resource Name parameter.

- If the ID Query parameter is set to VI_TRUE, this function queries the instrument ID and checks if it is valid for this instrument driver.

- If the Reset parameter is set to VI_TRUE, this function resets the instrument to a known state.

- Sends initialization commands to set the instrument to the state necessary for the operation of the instrument driver.

- Clears arbitrary waveform or initializes waveform structure according to arbitrary waveform in the instrument.

- Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Note:  
(1) This function creates a new session each time you invoke it. Although you can open more than one IVI session for the same resource, it is better not to do so.  You can use the same session in multiple program threads.  You can use the tkafg1k_LockSession and tkafg1k_UnlockSession functions to protect sections of code that require exclusive access to the resource.
(2) Content from the IVI specifications reproduced with permission from the IVI Foundation. 
The IVI Foundation and its member companies make no warranty of any kind with regard to this material, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose. The IVI Foundation and its member companies shall not be liable for errors contained herein or for incidental or consequential damages in connection with the furnishing, performance, or use of this material.

    �    Passes the resource name of the device to initialize.

You can also pass the name of a virtual instrument or logical name that you configure with the IVI Configuration utility.  The virtual instrument identifies a specific device and specifies the initial settings for the session.  A logical Name identifies a particular virtual instrument.

Refer to the table below for the exact grammar to use for this parameter.  Optional fields are shown in square brackets ([]).

Syntax
------------------------------------------------------
GPIB[board]::<primary address>[::secondary address]::INSTR
VXI[board]::<logical address>::INSTR
GPIB-VXI[board]::<logical address>::INSTR
ASRL<port>::INSTR
<LogicalName>
<Driver Session>

If you do not specify a value for an optional field, the following values are used:

Optional Field - Value
------------------------------------------------------
board - 0
secondary address - none (31)

The following table contains example valid values for this parameter.

"Valid Value" - Description
------------------------------------------------------
"GPIB::22::INSTR" - GPIB board 0, primary address 22 no
                    secondary address
"GPIB::22::5::INSTR" - GPIB board 0, primary address 22
                       secondary address 5
"GPIB1::22::5::INSTR" - GPIB board 1, primary address 22
                        secondary address 5
"VXI::64::INSTR" - VXI board 0, logical address 64
"VXI1::64::INSTR" - VXI board 1, logical address 64
"GPIB-VXI::64::INSTR" - GPIB-VXI board 0, logical address 64
"GPIB-VXI1::64::INSTR" - GPIB-VXI board 1, logical address 64
"ASRL2::INSTR" - COM port 2
"SampleInstr" - Logical name "SampleInstr"
"xyz432" - Logical Name or Driver Session "xyz432"
 
Default Value:  "GPIB::11::INSTR"
    �    Specifies if you want the instrument driver to perform an ID Query.

Valid Range:
VI_TRUE  (1) - Perform ID Query (Default Value)
VI_FALSE (0) - Skip ID Query

When you set this parameter to VI_TRUE, the driver verifies that the instrument you initialize is a type that this driver supports.  

In some circumstances it is undesirable to send an ID Query command string to the instrument.  When you set this parameter to VI_FALSE, the function initializes the instrument without performing an ID Query.     �    Specifies whether you want the to reset the instrument during the initialization procedure.

Valid Range:
VI_TRUE  (1) - Reset Device (Default Value)
VI_FALSE (0) - Don't Reset

    �    Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Notes:

(1) This function creates a new session each time you invoke it.  This is useful if you have multiple physical instances of the same type of instrument.  

(2) Avoid creating multiple concurrent sessions to the same physical instrument.  Although you can create more than one IVI session for the same resource, it is better not to do so.  A better approach is to use the same IVI session in multiple execution threads.  You can use functions tkafg1k_LockSession and tkafg1k_UnlockSession to protect sections of code that require exclusive access to the resource.

    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors    �    You can use this control to set the initial value of certain attributes for the session.  The following table lists the attributes and the name you use in this parameter to identify the attribute.

Name              Attribute Defined Constant   
--------------------------------------------
RangeCheck        TKAFG1K_ATTR_RANGE_CHECK
QueryInstrStatus  TKAFG1K_ATTR_QUERY_INSTRUMENT_STATUS   
Cache             TKAFG1K_ATTR_CACHE   
Simulate          TKAFG1K_ATTR_SIMULATE  
RecordCoercions   TKAFG1K_ATTR_RECORD_COERCIONS
DriverSetup       TKAFG1K_ATTR_DRIVER_SETUP

The Driver Setup attribute is used here to specifies configurations for the instrument. Firstly, when you disable ID Query through setting ID Query to No, or use simulating mode, you must specifies the model for the instrument. The following are the valid values for instrument model:
                  "AFG3011"
                  "AFG3021"
                  "AFG3022"
                  "AFG3101"
                  "AFG3102"
                  "AFG3251"
                  "AFG3252"
                  "AFG3021B"
                  "AFG3022B"

You could specify Driver Setup in the following way:
"DriverSetup=Model AFG3021"

Besides specifying instrument model, you could configure whether to clear instrument arbitrary waveform when initializing. If you want to clear instrument arbitrary waveform, you should add "ClearArbData is 1" to Driver Setup. Otherwise you could add "ClearArbData is 0" or ignore it. The initialization function does not clear arbitrary waveform by default.

Here is an example for specifying instrument model as AFG3021 and clearing arbitrary waveform:
"DriverSetup=Model AFG3021 and ClearArbData is 1"

The format of this string is, "AttributeName=Value" where AttributeName is the name of the attribute and Value is the value to which the attribute will be set.  To set multiple attributes, separate their assignments with a comma.

If you pass NULL or an empty string for this parameter and a VISA resource descriptor for the Resource Name parameter, the session uses the default values for the attributes. The default values for the attributes are shown below:

    Attribute Name     Default Value
    ----------------   -------------
    RangeCheck         VI_TRUE
    QueryInstrStatus   VI_FALSE
    Cache              VI_TRUE
    Simulate           VI_FALSE
    RecordCoercions    VI_FALSE
    DriverSetup        Model AFG3021

If you pass NULL or an empty string for this parameter and a virtual instrument or logical name for the Resource Name parameter, the session uses the values that you configure for virtual instrument or logical name with the IVI Configuration utility.

You can override the values of the attributes by assigning a value explicitly in a string you pass for this parameter.  You do not have to specify all of the attributes and may leave any of them out.  If you do not specify one of the attributes, its default value or the value that you configure with the IVI Configuration utility will be used.

The following are the valid values for ViBoolean attributes:

    True:     1, TRUE, or VI_TRUE
    False:    0, False, or VI_FALSE


Default Value:
"Simulate=0,RangeCheck=1,QueryInstrStatus=0,Cache=1,DriverSetup=Model AFG3102"
    E; >   �  �    Resource Name                     L! > �       ID Query                          N! >� �       Reset Device                      N� �j �  �    Instrument Handle                 Q�����  �    Status                            `u �  � �    Option String                   ����  `��                                            "GPIB::11::INSTR"   Yes VI_TRUE No VI_FALSE   Yes VI_TRUE No VI_FALSE    	           	           O"Simulate=0,RangeCheck=1,QueryInstrStatus=0,Cache=1,DriverSetup=Model AFG3102"    LCopyright 2005-2015, National Instruments Corporation. All Rights Reserved.   $    This function configures the operation mode of the function generator.  The operation mode determines how the function generator produces waveforms.  For example, you can choose to generate waveforms continuously, or to generate a discrete number of waveform cycles when a trigger occurs.      �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    The ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
    
�    Passes the operation mode you want the function generator to use.  The driver sets the TKAFG1K_ATTR_OPERATION_MODE attribute to this value.  The value you specify determines how the function generator produces output.

When you set this parameter to TKAFG1K_VAL_OPERATE_CONTINUOUS, the function generator continuously produces an output signal.

When you set this parameter to TKAFG1K_VAL_OPERATE_MODULATION, the function generator uses a certain method to modulate output signal. Current instrument driver supports the following modulation types:
- AM ( Amplitude Modulation )
- FM ( Frequency Modulation )
- PM ( Phase Modulation )
- FSK ( Frequency Shift Key Modulation )
- PWM ( Pulse Width Modulation )

When you set this parameter to TKAFG1K_VAL_OPERATE_SWEEP, you 
set the instrument to sweep mode. You can use the following function to configure sweep mode parameters.

- tkafg1k_ConfigureSweep 
- tkafg1k_ConfigureSweepEx

In stead of using this function, you can set the following attributes:                                
TKAFG1K_ATTR_SWEEP_START_FREQUENCY                     
TKAFG1K_ATTR_SWEEP_STOP_FREQUENCY                      
TKAFG1K_ATTR_SWEEP_TIME
TKAFG1K_ATTR_SWEEP_HOLD_TIME                            
TKAFG1K_ATTR_SWEEP_RETURN_TIME
TKAFG1K_ATTR_SWEEP_TYPE

When you set this parameter to TKAFG1K_VAL_OPERATE_BURST, you set the instrument to burst mode. You can use the following function to configure burst mode attributes:

- tkafg1k_ConfigureBurstCount
- tkafg1k_ConfigureBurstMode  

In stead of using this function, you can set the following attributes:
TKAFG1K_ATTR_BURST_COUNT
TKAFG1K_ATTR_BURST_MODE   

Valid Values:
TKAFG1K_VAL_OPERATE_CONTINUOUS - Generate output continuously
TKAFG1K_VAL_OPERATE_MODULATION - Generate modulated waveforms.
TKAFG1K_VAL_OPERATE_SWEEP - Generate sweeped waveforms.
TKAFG1K_VAL_OPERATE_BURST - Generate a burst of waveforms when a trigger occurs


Default Value:
TKAFG1K_VAL_OPERATE_CONTINUOUS - Generate output continuously

Notes:

(1) Not all kinds of operation mode and waveform shape combination are valid. For example, Sweep Mode is not selectable when waveform is PULSE. So if you try to configure operation mode to Sweep Mode in PULSE waveform, the function fails.
 
(2) When you want to set operation mode rather than Continuous Mode, you can also use the following enabling function instead.
tkafg1k_ConfigureAMEnabled - Enable/Disable AM
tkafg1k_ConfigureFMEnabled - Enable/Disable FM
tkafg1k_ConfigurePMEnabled - Enable/Disable PM
tkafg1k_ConfigureFSKEnabled - Enable/Disable FSK
tkafg1k_ConfigurePWMEnabled - Enable/Disable PWM
tkafg1k_ConfigureSweepEnabled - Enable/Disable Sweep Mode
tkafg1k_ConfigureBurstEnabled - Enable/Disable Burst Mode    p�����  �    Status                            �   �  �    Instrument Handle                 �i J  � �    Channel Name                      �p E � �    Operation Mode                     	               "1"               �Continuous TKAFG1K_VAL_OPERATE_CONTINUOUS Modulation TKAFG1K_VAL_OPERATE_MODULATION Sweep TKAFG1K_VAL_OPERATE_SWEEP Burst TKAFG1K_VAL_OPERATE_BURST   �    This function configures the output mode of the function generator.  The output mode determines the type of waveform the function generator produces.  For example, you can choose to output a standard waveform, an arbitrary waveform, or a sequence of arbitrary waveforms.  

Notes:
This function is not based on channel. If you specify an instrument with two channels, the function configures output mode for both channels.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This is the ViSession handles that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Passes the output mode you want the function generator to use.  The driver sets the TKAFG1K_ATTR_OUTPUT_MODE attribute to this value.  The value you specify determines which functions and attributes you use to configure the waveform the function generator produces.

When you set this parameter to TKAFG1K_VAL_OUTPUT_FUNC, you use the following function to configure the waveform:

- tkafg1k_ConfigureStandardWaveform
- tkafg1k_ConfigureRampSymmetry
- tkafg1k_ConfigurePulseWaveform
- tkafg1k_ConfigurePulseDelay

In stead of using this function, you can set the following attributes:

- TKAFG1K_ATTR_FUNC_WAVEFORM     
- TKAFG1K_ATTR_FUNC_AMPLITUDE 
- TKAFG1K_ATTR_FUNC_DC_OFFSET   
- TKAFG1K_ATTR_FUNC_FREQUENCY 
- TKAFG1K_ATTR_FUNC_START_PHASE   
- TKAFG1K_ATTR_FUNC_DUTY_CYCLE_HIGH
- TKAFG1K_ATTR_FUNC_RAMP_SYMMETRY                         
- TKAFG1K_ATTR_PULSE_DUTY_CYCLE    
- TKAFG1K_ATTR_PULSE_LEAD_DELAY 
- TKAFG1K_ATTR_PULSE_PERIOD                               
- TKAFG1K_ATTR_PULSE_LEADING_TIME                         
- TKAFG1K_ATTR_PULSE_TRAILING_TIME

When you set this parameter to TKAFG1K_VAL_OUTPUT_ARB, you use the following functions to configure the waveform:

- tkafg1k_QueryArbWfmCapabilities
- tkafg1k_CreateArbWaveform
- tkafg1k_CreateLineInterpolateArbWfm
- tkafg1k_CreateStandardShapeArbWfm  
- tkafg1k_ClearArbWaveform
- tkafg1k_ConfigureSampleRate
- tkafg1k_ConfigureArbWaveform 

In stead of using the tkafg1k_ConfigureSampleRate and tkafg1k_ConfigureArbWaveform functions, you can set the following attributes:

- TKAFG1K_ATTR_ARB_WAVEFORM_HANDLE  
- TKAFG1K_ATTR_ARB_GAIN
- TKAFG1K_ATTR_ARB_OFFSET  
- TKAFG1K_ATTR_ARB_SAMPLE_RATE 

You can also use the TKAFG1K_ATTR_ARB_FREQUENCY attribute or tkafg1k_ConfigureArbFrequency function to configure the rate at which the function generator produces one complete cycle of an arbitrary waveform.

In stead of using the tkafg1k_ConfigureSampleRate, you can set the following attributes:

- TKAFG1K_ATTR_ARB_GAIN
- TKAFG1K_ATTR_ARB_OFFSET  
- TKAFG1K_ATTR_ARB_SAMPLE_RATE 

Valid Values:
TKAFG1K_VAL_OUTPUT_FUNC - Standard Function Output
TKAFG1K_VAL_OUTPUT_ARB  - Arbitrary Waveform Output
 
Default Value:
TKAFG1K_VAL_OUTPUT_FUNC - Standard Function Output
    �[����  �    Status                            �5   �  �    Instrument Handle                 �� >  � �    Output Mode                        	                          TStandard Function TKAFG1K_VAL_OUTPUT_FUNC Arbitrary Waveform TKAFG1K_VAL_OUTPUT_ARB   -    This function configures the output mode of the function generator for the channel you specify. The output mode determines the type of waveform the function generator produces.  For example, you can choose to output a standard waveform, an arbitrary waveform, or a sequence of arbitrary waveforms.       �    This is the ViSession handles that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors    �    Passes the output mode you want the function generator to use.  The driver sets the TKAFG1K_ATTR_OUTPUT_MODE attribute to this value.  The value you specify determines which functions and attributes you use to configure the waveform the function generator produces.

When you set this parameter to TKAFG1K_VAL_OUTPUT_FUNC, you use the following function to configure the waveform:

- tkafg1k_ConfigureStandardWaveform
- tkafg1k_ConfigureRampSymmetry
- tkafg1k_ConfigurePulseWaveform
- tkafg1k_ConfigurePulseDelay

In stead of using this function, you can set the following attributes:

- TKAFG1K_ATTR_FUNC_WAVEFORM     
- TKAFG1K_ATTR_FUNC_AMPLITUDE 
- TKAFG1K_ATTR_FUNC_DC_OFFSET   
- TKAFG1K_ATTR_FUNC_FREQUENCY 
- TKAFG1K_ATTR_FUNC_START_PHASE   
- TKAFG1K_ATTR_FUNC_DUTY_CYCLE_HIGH
- TKAFG1K_ATTR_FUNC_RAMP_SYMMETRY                         
- TKAFG1K_ATTR_PULSE_DUTY_CYCLE    
- TKAFG1K_ATTR_PULSE_LEAD_DELAY 
- TKAFG1K_ATTR_PULSE_PERIOD                               
- TKAFG1K_ATTR_PULSE_LEADING_TIME                         
- TKAFG1K_ATTR_PULSE_TRAILING_TIME

When you set this parameter to TKAFG1K_VAL_OUTPUT_ARB, you use the following functions to configure the waveform:

- tkafg1k_QueryArbWfmCapabilities
- tkafg1k_CreateArbWaveform
- tkafg1k_CreateLineInterpolateArbWfm
- tkafg1k_CreateStandardShapeArbWfm  
- tkafg1k_ClearArbWaveform
- tkafg1k_ConfigureSampleRate
- tkafg1k_ConfigureArbWaveform 

In stead of using the tkafg1k_ConfigureSampleRate and tkafg1k_ConfigureArbWaveform functions, you can set the following attributes:

- TKAFG1K_ATTR_ARB_WAVEFORM_HANDLE  
- TKAFG1K_ATTR_ARB_GAIN
- TKAFG1K_ATTR_ARB_OFFSET  
- TKAFG1K_ATTR_ARB_SAMPLE_RATE 

You can also use the TKAFG1K_ATTR_ARB_FREQUENCY attribute or tkafg1k_ConfigureArbFrequency function to configure the rate at which the function generator produces one complete cycle of an arbitrary waveform.

In stead of using the tkafg1k_ConfigureSampleRate, you can set the following attributes:

- TKAFG1K_ATTR_ARB_GAIN
- TKAFG1K_ATTR_ARB_OFFSET  
- TKAFG1K_ATTR_ARB_SAMPLE_RATE 

Valid Values:
TKAFG1K_VAL_OUTPUT_FUNC - Standard Function Output
TKAFG1K_VAL_OUTPUT_ARB  - Arbitrary Waveform Output
 
Default Value:
TKAFG1K_VAL_OUTPUT_FUNC - Standard Function Output
     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
    �   �  �    Instrument Handle                 ������  �    Status                            �� > � � �    Output Mode                       �b >  � �    Channel Name                           	                      TStandard Function TKAFG1K_VAL_OUTPUT_FUNC Arbitrary Waveform TKAFG1K_VAL_OUTPUT_ARB    "1"    M    This function configures the output impedance for the channel you specify.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
    �    Passes the impedance value you want the function generator to use.  The driver sets the TKAFG1K_ATTR_OUTPUT_IMPEDANCE attribute to this value.  You can set the impedance to any value from 1 Ohms to 10k Ohms, or INFINITY. A value of 0.0 indicates that the function generator is in the impedance of INFINITY, or you can use defined macro TKAFG1K_VAL_IMPEDANCE_INFINITY instead.

Units: Ohms

Valid Values:
TKAFG1K_VAL_IMPEDANCE_INFINITY (0.0 Ohms)
1.0 -- 10k Ohms

Default Value:
50.0 Ohms

    �����  �    Status                            ��   �  �    Instrument Handle                 Ԧ >  � �    Channel Name                      խ > � � �    Impedance                          	               "1"    50.0    D    This function enables or disables the function generator's output.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
     �    Specifies whether you want to enable or disable the output.  The driver uses this value to set the TKAFG1K_ATTR_OUTPUT_ENABLED attribute.

Valid Values:
VI_TRUE  - Enable the output  (Default)
VI_FALSE - Disable the output
    ������  �    Status                            �   �  �    Instrument Handle                 �y >  � �    Channel Name                      � > � � �    Enabled                            	               "1"   True VI_TRUE False VI_FALSE   �    This function configure pulse duty cycle.

The instrument will automatically configure the settings of leading edge and trailing edge when the duty cycle is varied.

Notes:
(1) Because the attributes set in this function can only be operated correctly in PULSE waveform, the driver limits its accessibility to PULSE waveform. To ensure this function works, you should configure waveform shape to PULSE before using this function.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
    �    Sets the duty cycle of pulse waveform for the channel you specify. Driver sets the TKAFG1K_ATTR_PULSE_DUTY_CYCLE attribute to this value.
For frequencies less than 1 MHz, the duty cycle is adjustable within the range of 0.1% to 99.9% in increments of 0.1. For frequencies greater than 1 MHz, the duty cycle is fixed at 50%.
The instrument will hold the settings of leading edge and trailing edge when the duty cycle is varied.

units: Percentage (%)

Valid Range: 0.1 - 99.9 %

Default Value: 20.0 %    �*#����  �    Status                            �# 
  �  �    Instrument Handle                 �� ' 
 � �    Channel Name                      �� * � �  �    Duty Cycle                         	               "1"    20.0   '    This function configures the attributes of the function generator that affect standard waveform generation.  These attributes are the waveform, amplitude, DC offset, frequency, and start phase.

Notes:
(1) You must set the output mode to TKAFG1K_VAL_OUTPUT_FUNC before calling this function.

(2) If the waveform parameter is set to TKAFG1K_VAL_WFM_DC, this function ignores the amplitude, frequency, and start phase parameters. If the waveform parameter is set to TKAFG1K_VAL_WFM_PRN, this function ignores the frequency and start phase parameters.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
    l    Passes the amplitude of the standard waveform that you want the function generator to produce.  This value is the amplitude at the output terminal.  The driver sets the TKAFG1K_ATTR_FUNC_AMPLITUDE attribute to this value.  For example,  to produce a waveform ranging from -5.00 to +5.00 volts, set the Amplitude to 10.00 volts.

Units: Volts peak-to-peak (Vpp)

The valid range for amplitude is decided by output impedance and instrument model. And when you set amplitude, you should also note that actual setting range is related to DC offset.

Model                     Impedance        Valid Range
-------------------------------------------------------
AFG3011                   50 Ohms          0.02 - 20 (Vpp)
AFG3011                   INFINITY         0.04 - 40 (Vpp)

AFG3021(B)/AFG3022(B)     50 Ohms          0.01 - 10 (Vpp)
AFG3021(B)/AFG3022(B)     INFINITY         0.02 - 20 (Vpp)

AFG3101/AFG3102           50 Ohms          0.02 - 10 (Vpp)
AFG3101/AFG3102           INFINITY         0.04 - 20 (Vpp)

AFG3251/AFG3252           50 Ohms          0.05 - 5  (Vpp)
AFG3251/AFG3252           INFINITY         0.1  - 10 (Vpp)  

AFG2021                   50 Ohms          0.01 - 10 (Vpp)
AFG2021                   INFINITY         0.02 - 20 (Vpp)

Default Value: 1 (Vpp)

Notes:

(1) This parameter is ignored when you set the Waveform parameter to TKAFG1K_VAL_WFM_DC.

(2) For AFG3101(B) and AFG3102(B), amplitude setting range in burst mode is different from other mode. 
Impedance        Valid Range
-------------------------------------------------------
50 Ohms          0.05 - 4  (Vpp)
INFINITY         0.1  - 8  (Vpp)

Notes:
(1) The valid ranges for DC offset and Amplitude are both restricted by the Amplitude High Limit and Low Limit to protect your DUT. The following rules are applied:
DC offest + Amplitude/2 �� Amplitude High Limit
DC offset - Amplitude/2 �� Amplitude Low Limit    �    Passes the DC offset of the standard waveform that you want the function generator to produce.  This value is the offset at the output terminal.  The value is the offset from ground to the center of the waveform you specify with the Waveform parameter.  The driver sets the TKAFG1K_ATTR_FUNC_DC_OFFSET attribute to this value.  For example,  to configure a waveform with an amplitude of 10.00 volts to range from 0.00 volts to +10.00 volts, set the DC Offset be to 5.00 volts.

Units: Volts (V)

The valid range for DC offset is decided by output impedance and instrument model. And when you set amplitude, you should also note that actual setting range is related to amplitude.

Model                     Impedance        Valid Range
-------------------------------------------------------
AFG3011                   50 Ohms          -10 - 10   (V)
AFG3011                   INFINITY         -20 - 20   (V)

AFG3021(B)/AFG3022(B)     50 Ohms          -5  - 5    (V)
AFG3021(B)/AFG3022(B)     INFINITY         -10 - 10   (V)

AFG3101/AFG3102           50 Ohms          -5  - 5    (V)
AFG3101/AFG3102           INFINITY         -10 - 10   (V)

AFG3251/AFG3252           50 Ohms          -2.5 - 2.5 (V)
AFG3251/AFG3252           INFINITY         -5   - 5   (V)  

AFG2021                   50 Ohms          -4.5 - 4.5 (V)
AFG2021                   INFINITY         -9 - 9     (V)

Default Value: 0.00  (V)

Notes:
(1) The valid ranges for DC offset and Amplitude are both restricted by the Amplitude High Limit and Low Limit to protect your DUT. The following rules are applied:
DC offest + Amplitude/2 �� Amplitude High Limit
DC offset - Amplitude/2 �� Amplitude Low Limit    
�    Passes the frequency of the standard waveform that you want the function generator to produce.  The driver sets the TKAFG1K_ATTR_FUNC_FREQUENCY attribute to this value.

Units: Hertz (Hz)

The valid range of frequency is decided by instrument model and waveform shape. And you should note that when you specify SINE as waveform, the frequency value range is different in burst mode and in other operation modes.

Model                     Waveform         Valid Range
-------------------------------------------------------
AFG3011                   SINE             1��- 10M     (Hz)
AFG3011                   SINE(Burst Mode) 1��- 5M      (Hz)
AFG3011                   SQUARE           1��- 5M      (Hz)
AFG3011                   RAMP             1��- 100k    (Hz)
AFG3011                   PULSE            1m - 5M      (Hz)
AFG3011                   Advanced Shape   1��- 100k    (Hz)

AFG3021(B)/AFG3022(B)     SINE             1��- 25M     (Hz)
AFG3021(B)/AFG3022(B)     SINE(Burst Mode) 1��- 12.5M   (Hz)
AFG3021(B)/AFG3022(B)     SQUARE           1��- 12.5M   (Hz)
AFG3021(B)/AFG3022(B)     RAMP             1��- 250k    (Hz)
AFG3021(B)/AFG3022(B)     PULSE            1m - 12.5M   (Hz)
AFG3021(B)/AFG3022(B)     Advanced Shape   1��- 250k    (Hz)

AFG3101/AFG3102           SINE             1��- 100M    (Hz)
AFG3101/AFG3102           SINE(Burst Mode) 1��- 50M     (Hz)
AFG3101/AFG3102           SQUARE           1��- 50M     (Hz)
AFG3101/AFG3102           RAMP             1��- 1M      (Hz)
AFG3101/AFG3102           PULSE            1m - 50M     (Hz)
AFG3101/AFG3102           Advanced Shape   1��- 1M      (Hz)

AFG3251/AFG3252           SINE             1��- 240M    (Hz)
AFG3251/AFG3252           SINE(Burst Mode) 1��- 120M    (Hz)
AFG3251/AFG3252           SQUARE           1��- 120M    (Hz)
AFG3251/AFG3252           RAMP             1��- 2.4M    (Hz)
AFG3251/AFG3252           PULSE            1m - 120M    (Hz)
AFG3251/AFG3252           Advanced Shape   1��- 2.4M    (Hz)   

AFG2021                   SINE             1��- 20M     (Hz)
AFG2021                   SINE(Burst Mode) 1��- 10M     (Hz)
AFG2021                   SQUARE           1��- 10M     (Hz)
AFG2021                   RAMP             1��- 200k    (Hz)
AFG2021                   PULSE            1m - 10M     (Hz)
AFG2021                   Advanced Shape   1��- 200k    (Hz)

Default Value: 1 M   (Hz)

Notes:
(1) This parameter is ignored when you set the Waveform parameter to TKAFG1K_VAL_WFM_DC and TKAFG1K_VAL_WFM_PRN.

(2) Advanced Shape consists of the following waveform shape:
                   SINC 
                   Gaussian 
                   Lorentz 
                   Erise 
                   Edecay 
                   Haversine
    �    Passes the horizontal offset of the standard waveform you want the function generator to produce.  You specify this attribute in degrees of one waveform cycle.  The driver sets the TKAFG1K_ATTR_FUNC_START_PHASE attribute to this value.  A start phase of 180 degrees means output generation begins half way through the waveform.  A start phase of 360 degrees offsets the output by an entire waveform cycle, which is identical to a start phase of 0 degrees.


Units: Degrees of one cycle

Valid Range:  -180.00 - +180.00 (degrees)

Default Value: 0.00 (degrees)

Notes:
(1) This parameter is ignored when you set the Waveform parameter to TKAFG1K_VAL_WFM_DC and TKAFG1K_ATTR_FUNC_START_PHASE.    D    Pass the standard waveform that you want the function generator to produce.  The driver sets the TKAFG1K_ATTR_FUNC_WAVEFORM attribute to this value.

Valid Values:
TKAFG1K_VAL_WFM_SINE      - Sinusoid waveform
TKAFG1K_VAL_WFM_SQUARE    - Square waveform 
TKAFG1K_VAL_WFM_PULS      - Pulse waveform
TKAFG1K_VAL_WFM_RAMP      - Ramp waveform 
TKAFG1K_VAL_WFM_PRN       - Noise waveform


Default Value:
TKAFG1K_VAL_WFM_SINE      - Sinusoid waveform

Notes:
Memory 1 and Memory 2 are only supported by AFG3011C, AFG3021C, AFG3051C, AFG3052C, AFG3101C, AFG3102C, AFG3251C, AFG3252C
   �����  �    Status                           �   �  �    Instrument Handle                � >  � �    Channel Name                     � >j � �    Amplitude                        � �  � �    DC Offset                        !� � � � �    Frequency                        ,H �j � �    Start Phase                      / > � � �    Waveform                           	               "1"    1    0.00    1000000    0.00               mSine TKAFG1K_VAL_WFM_SINE Square TKAFG1K_VAL_WFM_SQUARE Pulse TKAFG1K_VAL_WFM_PULS Ramp TKAFG1K_VAL_WFM_RAMP   �    This function configures the sample rate attribute, which determines the rate at which the function generator produces arbitrary waveforms.  
 
Actualy this attribute is not configurable on the instrument. Whatever value you set for this attribute, the value read out is determined by the instrument depending on the arbitraty waveform length.

Notes:
You must set the output mode to TKAFG1K_VAL_OUTPUT_ARB before calling this function.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Passes the sample rate at which you want the function generator to output arbitrary waveforms.  The driver sets the TKAFG1K_ATTR_ARB_SAMPLE_RATE attribute to this value. 

Actualy this attribute is not configurable on the instrument. Whatever value you set for this attribute, the value read out is determined by the instrument depending on the arbitraty waveform length.

Units: Samples-per-Second (Samp/s)

Default Value: 1000 M (Samp/s)   5j����  �    Status                           DD   �  �    Instrument Handle                E >  �  �    Sample Rate (Samp/s)               	               1000000000   i    This function creates an arbitrary waveform and returns a handle that identifies that waveform.  You pass this handle to the tkafg1k_ConfigureArbWaveform function to produce that waveform.  

The function uses data array passed to initialize new arbitrary waveform.

Notes:
You must set the output mode to TKAFG1K_VAL_OUTPUT_ARB before calling this function.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Passes the size of the arbitrary waveform you want create.

The size must meet the following restrictions:

    - The size is less than or equal to the maximum waveform size the instrument allows.

    - The size is greater than or equal to the minimum waveform size the instrument allows.

    - The size is an integer multiple of the instrument's waveform quantum.

    You can obtain these values from the Maximum Waveform Size, Minimum Waveform Size, and Waveform Quantum parameters of the tkafg1k_QueryArbWfmCapabilities function.

The valid range of waveform size is decided by instrument model. 

Valid Range:
Model                     Valid Range
-------------------------------------
AFG3011                   2 to 131072
AFG3021/AFG3022           2 to 65536
AFG3021B/AFG3022B         2 to 131072
AFG3101/AFG3102           2 to 131072
AFG3251/AFG3252           2 to 131072
AFG2021                   2 to 131072  

Default Value: 1000
        Specifies the array of data you want to use for the new arbitrary waveform.  The array must have at least as many elements as the value you specify in the Waveform Size parameter.

You must normalize the data points in the array to be between -1.00 and +1.00.

Default Value: None
     �    Returns the handle that identifies the new arbitrary waveform.  You pass this handle to the tkafg1k_ConfigureArbWaveform function to generate the arbitrary waveform.    H�����  �    Status                           W�   �  �    Instrument Handle                X� >  �  �    Waveform Size                    \F > � � �    Waveform Data Array              ]i >� �  �    Waveform Handle                    	               1000        	           �    This function creates a standard shape arbitrary waveform and returns a handle that identifies that waveform.  You pass this handle to the tkafg1k_ConfigureArbWaveform function to produce that waveform.  

The function uses the specified waveform type to initialize new arbitrary waveform.

Notes:
You must set the output mode to TKAFG1K_VAL_OUTPUT_ARB before calling this function.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Passes the size of the arbitrary waveform you want create.

The size must meet the following restrictions:

    - The size is less than or equal to the maximum waveform size the instrument allows.

    - The size is greater than or equal to the minimum waveform size the instrument allows.

    - The size is an integer multiple of the instrument's waveform quantum.

    You can obtain these values from the Maximum Waveform Size, Minimum Waveform Size, and Waveform Quantum parameters of the tkafg1k_QueryArbWfmCapabilities function.

The valid range of waveform size is decided by instrument model. 

Valid Range:
Model                     Valid Range
-------------------------------------
AFG3011                   2 to 131072
AFG3021/AFG3022           2 to 65536
AFG3021B/AFG3022B         2 to 131072
AFG3101/AFG3102           2 to 131072
AFG3251/AFG3252           2 to 131072

Default Value: 1000
    �    Specifies the waveform type of the new arbitrary waveform.

Driver supports 5 kind of waveforms.

Valid Values:
--------------------------------------------------------
TKAFG1K_VAL_ARB_WFM_SINE         - Sinusoid Waveform
TKAFG1K_VAL_ARB_WFM_SQUARE       - Square Waveform
TKAFG1K_VAL_ARB_WFM_PULS         - Pulse Waveform
TKAFG1K_VAL_ARB_WFM_RAMP         - Ramp Waveform
TKAFG1K_VAL_ARB_WFM_PRN          - Noise Waveform

Default Value: TKAFG1K_VAL_ARB_WFM_SINE     �    Returns the handle that identifies the new arbitrary waveform.  You pass this handle to the tkafg1k_ConfigureArbWaveform function to generate the arbitrary waveform.    `�����  �    Status                           o�   �  �    Instrument Handle                pl >  �  �    Waveform Size                    s� > � � �    Waveform Type                    u� >� �  �    Waveform Handle                    	               1000               �SINE TKAFG1K_VAL_ARB_WFM_SINE SQUARE TKAFG1K_VAL_ARB_WFM_SQUARE PULSE TKAFG1K_VAL_ARB_WFM_PULS RAMP TKAFG1K_VAL_ARB_WFM_RAMP NOISE TKAFG1K_VAL_ARB_WFM_PRN    	            �    This function gets the waveform handle from a specified slot.  If the specified slot is empty, the function returns VI_NULL as the waveform handle.

Notes:
You must set the output mode to TKAFG1K_VAL_OUTPUT_ARB before calling this function.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
     ,    Returns the handle on the specified slot.      �    Pass the slot number for which you want to get the arbitrary waveform.

Valid Values:
For the AFG1022, Slot can be any number from 0 to 255.
For the AFG1062, Slot can be any number from 0 to 31.

Default Value: 
0
   yW����  �    Status                           �1   �  �    Instrument Handle                �� >� �  �    Waveform Handle                  �% >  �  �    Slot                               	               	            0   }    This function creates an arbitrary waveform on a specified slot and returns a handle that identifies that waveform.  You pass this handle to the tkafg1k_ConfigureArbWaveform function to produce that waveform.  

The function uses data array passed to initialize new arbitrary waveform.

Notes:
You must set the output mode to TKAFG1K_VAL_OUTPUT_ARB before calling this function.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Passes the size of the arbitrary waveform you want create.

The size must meet the following restrictions:

    - The size is less than or equal to the maximum waveform size the instrument allows.

    - The size is greater than or equal to the minimum waveform size the instrument allows.

    - The size is an integer multiple of the instrument's waveform quantum.

    You can obtain these values from the Maximum Waveform Size, Minimum Waveform Size, and Waveform Quantum parameters of the tkafg1k_QueryArbWfmCapabilities function.

The valid range of waveform size is decided by instrument model. 

Valid Range:
Model                     Valid Range
-------------------------------------
AFG3011                   2 to 131072
AFG3021/AFG3022           2 to 65536
AFG3021B/AFG3022B         2 to 131072
AFG3101/AFG3102           2 to 131072
AFG3251/AFG3252           2 to 131072
AFG2021                   2 to 131072

Default Value: 1000
        Specifies the array of data you want to use for the new arbitrary waveform.  The array must have at least as many elements as the value you specify in the Waveform Size parameter.

You must normalize the data points in the array to be between -1.00 and +1.00.

Default Value: None
     �    Returns the handle that identifies the new arbitrary waveform.  You pass this handle to the tkafg1k_ConfigureArbWaveform function to generate the arbitrary waveform.      �    Pass the slot number for which you want to create the arbitrary waveform.

Valid Values:
    TKAFG1K_VAL_WFM_SLOT1
    TKAFG1K_VAL_WFM_SLOT2
    TKAFG1K_VAL_WFM_SLOT3
    TKAFG1K_VAL_WFM_SLOT4

Default Value: 
    TKAFG1K_VAL_WFM_SLOT1
     �    Specifies whether you want to overwrite the existing data in the slot.

Valid Values:
VI_TRUE  - True
VI_FALSE - False (Default)   �����  �    Status                           �Y   �  �    Instrument Handle                � >  �  �    Waveform Size                    �� > � � �    Waveform Data Array              �� >� �  �    Waveform Handle                  �� �  �  �    Slot                             �� � � �  �    Overwrite                          	               1000        	            TKAFG1K_VAL_WFM_SLOT1    True VI_TRUE False VI_FALSE   �    This function creates a standard shape arbitrary waveform on a specified slot and returns a handle that identifies that waveform.  You pass this handle to the tkafg1k_ConfigureArbWaveform function to produce that waveform.  

The function uses the specified waveform type to initialize new arbitrary waveform.

Notes:
You must set the output mode to TKAFG1K_VAL_OUTPUT_ARB before calling this function.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Passes the size of the arbitrary waveform you want create.

The size must meet the following restrictions:

    - The size is less than or equal to the maximum waveform size the instrument allows.

    - The size is greater than or equal to the minimum waveform size the instrument allows.

    - The size is an integer multiple of the instrument's waveform quantum.

    You can obtain these values from the Maximum Waveform Size, Minimum Waveform Size, and Waveform Quantum parameters of the tkafg1k_QueryArbWfmCapabilities function.

The valid range of waveform size is decided by instrument model. 

Valid Range:
Model                     Valid Range
-------------------------------------
AFG3011                   2 to 131072
AFG3021/AFG3022           2 to 65536
AFG3021B/AFG3022B         2 to 131072
AFG3101/AFG3102           2 to 131072
AFG3251/AFG3252           2 to 131072

Default Value: 1000
    �    Specifies the waveform type of the new arbitrary waveform.

Driver supports 5 kind of waveforms.

Valid Values:
--------------------------------------------------------
TKAFG1K_VAL_ARB_WFM_SINE         - Sinusoid Waveform
TKAFG1K_VAL_ARB_WFM_SQUARE       - Square Waveform
TKAFG1K_VAL_ARB_WFM_PULS         - Pulse Waveform
TKAFG1K_VAL_ARB_WFM_RAMP         - Ramp Waveform
TKAFG1K_VAL_ARB_WFM_PRN          - Noise Waveform

Default Value: TKAFG1K_VAL_ARB_WFM_SINE     �    Returns the handle that identifies the new arbitrary waveform.  You pass this handle to the tkafg1k_ConfigureArbWaveform function to generate the arbitrary waveform.      �    Pass the slot number for which you want to create the arbitrary waveform.

Valid Values:
    TKAFG1K_VAL_WFM_SLOT1
    TKAFG1K_VAL_WFM_SLOT2
    TKAFG1K_VAL_WFM_SLOT3
    TKAFG1K_VAL_WFM_SLOT4

Default Value: 
    TKAFG1K_VAL_WFM_SLOT1
     �    Specifies whether you want to overwrite the existing data in the slot.

Valid Values:
VI_TRUE  - True
VI_FALSE - False (Default)   ������  �    Status                           �m   �  �    Instrument Handle                �- >  �  �    Waveform Size                    �� > � � �    Waveform Type                    �� >� �  �    Waveform Handle                  �F �  �  �    Slot                             �< � � �       Overwrite                          	               1000               �SINE TKAFG1K_VAL_ARB_WFM_SINE SQUARE TKAFG1K_VAL_ARB_WFM_SQUARE PULSE TKAFG1K_VAL_ARB_WFM_PULS RAMP TKAFG1K_VAL_ARB_WFM_RAMP NOISE TKAFG1K_VAL_ARB_WFM_PRN    	            TKAFG1K_VAL_WFM_SLOT1    True VI_TRUE False VI_FALSE    �    This function returns the attributes of the function generator that are related to creating arbitrary waveforms.  These attributes are the maximum number of waveforms, waveform quantum, minimum waveform size, and maximum waveform size.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    "    Returns the maximum number of arbitrary waveforms that the function generator allows.  The driver obtains this value from the TKAFG1K_ATTR_MAX_NUM_WAVEFORMS attribute.

Notes:

(1) If you do not want to obtain the maximum number of waveforms, pass a value of VI_NULL for this parameter. 
    a    The size (i.e. number of points) of each waveform must be a multiple of a constant quantum value.  This parameter obtains the quantum value the function generator uses.  The driver returns this value from the TKAFG1K_ATTR_WAVEFORM_QUANTUM attribute.  For example,  when this attribute returns a value of 8, all waveform sizes must be a multiple of 8.
        Returns the minimum number of points the function generator allows in a waveform.  The driver obtains this value from the TKAFG1K_ATTR_MIN_WAVEFORM_SIZE attribute.  

Notes:

(1) If you do not want to obtain the minimum waveform size, pass a value of VI_NULL for this parameter. 
        Returns the maximum number of points the function generator allows in a waveform.  The driver obtains this value from the TKAFG1K_ATTR_MAX_WAVEFORM_SIZE attribute.

Notes:

(1) If you do not want to obtain the maximum waveform size, pass a value of VI_NULL for this parameter. 
    �4����  �    Status                           �   �  �    Instrument Handle                �� > % �  �    Maximum Number of Waveforms      �� > � � �    Waveform Quantum                 �a >� � �    Minimum Waveform Size            ԃ �� �  �    Maximum Waveform Size              	               	            	            	            	               This function configures the attributes of the function generator that affect arbitrary waveform generation.  These attributes are the arbitrary waveform handle, gain, and offset.

Notes:
You must set the output mode to TKAFG1K_VAL_OUTPUT_ARB before calling this function.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
    �    Passes the handle of the arbitrary waveform you want the function generator to produce.  The driver sets the TKAFG1K_ATTR_ARB_WAVEFORM_HANDLE attribute to this value.  You create an arbitrary waveform using the tkafg1k_CreateArbWaveform function.  The tkafg1k_CreateArbWaveform function returns a handle that you use to identify the waveform.

Valid Range:
10000: User 1
10001: User 2
10002: User 3
10003: User 4
10011: Edit Memory

Default Value: None

Notes:
For AFG3kC series, Edit Memory is the same as Edit Memory 1 for channel 1 and Edit Memory 2 for channel 2 since firmware version 1.0.4.

SCPI Command:
[SOURce[1|2]]:FUNCtion[:SHAPe] {USER[1]|USER2|USER3|USER4|EMEMory| EMEMory1 |EMEMory2}    �    Specifies the factor by which the function generator scales the arbitrary waveform data. When you create arbitrary waveforms, you must first normalize the data points to a range of -1.00 to +1.00.  You use this attribute to scale the arbitrary waveform to other ranges.  The driver sets the TKAFG1K_ATTR_ARB_GAIN attribute to this value.    For example, to configure the output signal to range from -2.00 volts to +2.00 volts, set the Gain to 2.00.

Units: Volts (V)

Default Value: 0.5 (V)    P    Specifies the value the function generator adds to the arbitrary waveform data.  When you create arbitrary waveforms, you must first normalize the data points to a range of -1.00 to +1.00.  You use this parameter to shift the arbitrary waveform's range.  The driver sets the TKAFG1K_ATTR_ARB_OFFSET attribute to this value.  For example,  to configure the output signal to range from 0.00 volts to 2.00 volts instead of -1.00 volts to 1.00 volts, set the Offset to 1.00.

Units: Volts (V)

The valid range for DC offset is decided by output impedance and instrument model. And when you set amplitude, you should also note that actual setting range is related to amplitude.

Model                     Impedance        Valid Range
-------------------------------------------------------
AFG3011                   50 Ohms          -10 - 10   (V)
AFG3011                   INFINITY         -20 - 20   (V)

AFG3021(B)/AFG3022(B)     50 Ohms          -5  - 5    (V)
AFG3021(B)/AFG3022(B)     INFINITY         -10 - 10   (V)

AFG3021C/AFG3022C         50 Ohms          -5  - 5    (V)
AFG3021C/AFG3022C         INFINITY         -10 - 10   (V)

AFG3051C/AFG3052C         50 Ohms          -5  - 5    (V)
AFG3051C/AFG3052C         INFINITY         -10 - 10   (V)

AFG3101/AFG3102           50 Ohms          -5  - 5    (V)
AFG3101/AFG3102           INFINITY         -10 - 10   (V)

AFG3251/AFG3252           50 Ohms          -2.5 - 2.5 (V)
AFG3251/AFG3252           INFINITY         -5   - 5   (V)  

AFG2021                   50 Ohms          -4.5 - 4.5 (V)
AFG2021                   INFINITY         -9 - 9     (V)

Default Value: 0.00  (V)

Notes:
(1) The valid ranges for Offset and Gain are both restricted by the Amplitude High Limit and Low Limit to protect your DUT. The following rules are applied:
Offest + Gain �� Amplitude High Limit
Offset - Gain �� Amplitude Low Limit   �=����  �    Status                           �   �  �    Instrument Handle                �� >  � �    Channel Name                     �� > � � �    Waveform Handle                  � >j � �    Gain (V)                         � �  � �    Offset (V)                         	               "1"        0.5    0.00    �    This function configures the arbitrary waveform frequency.  This is the rate at which the function generator produces one full cycle of an arbitrary waveform.
  
Notes:
You must set the output mode to TKAFG1K_VAL_OUTPUT_ARB before calling this function.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Passes the frequency at which you want the function generator to one cycle of an arbitrary waveform.  The driver sets the TKAFG1K_ATTR_ARB_FREQUENCY attribute to this value. 

Units: Hz

Valid Range:
The valid range of frequency is decided by instrument model.

Model                      Valid Range
--------------------------------------------------------
AFG3011                    1m - 5M      (Hz)
AFG3021(B)/AFG3022(B)      1m - 12.5M   (Hz)
AFG3021C/AFG3022C          1m - 12.5M   (Hz)
AFG3051C/AFG3052C          1m - 25M     (Hz)
AFG3101/AFG3102            1m - 50M     (Hz)
AFG3251/AFG3252            1m - 120M    (Hz)
AFG2012                    1m - 10M     (Hz) 

In Burst mode:
AFG3011                    1m - 2.5M    (Hz)
AFG3021(B)/AFG3022(B)      1m - 6.25M   (Hz)
AFG3021C/AFG3022C          1m - 6.5M    (Hz)
AFG3051C/AFG3052C          1m - 12.5M   (Hz)
AFG3101/AFG3102            1m - 25M     (Hz)
AFG3251/AFG3252            1m - 60M     (Hz)
AFG2012                    1m - 5M      (Hz)

Default Value: 1 M (Hz)
     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
   �]����  �    Status                           7   �  �    Instrument Handle                � > � �  �    Frequency                         >  � �    Channel Name                       	               1000000    "1"   }    This function configures whether to enable or disable burst mode for the channel you specify.

Notes:
(1) To enable burst mode, except for this function, you can also use tkafg1k_ConfigureOperationMode function and configure operation mode to TKAFG1K_VAL_OPERATE_BURST.

(2) To enhance program correctness make sure to set appropriate waveform shape before calling this function.     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
        Pass whether you want to enable or disable burst mode. When the burst mode is enabled, the function generator produces cycles of waveform when it receives a trigger event.

Valid Values:
VI_TRUE            - Enable Burst Mode (Default)
VI_FALSE           - Disable Burst Mode



   �   �  �    Instrument Handle                I����  �    Status                           # >  � �    Channel Name                     * > � �       Burst Enabled                          	           "1"   True 1 False 0    �    This function configures the burst count.  The function generator produces a burst of waveform cycles when it receives a trigger event and when the TKAFG1K_ATTR_OPERATION_MODE attribute is set to TKAFG1K_VAL_OPERATE_BURST.
     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    O    Passes delay time in the burst mode for the specified
channel. It specifies a time delay between the trigger and the signal output. This function is available only in the Triggered burst mode.The driver sets the TKAFG1K_ATTR_BURST_DELAY attribute to this value.

Valid Range:
TKAFG1K_VAL_BURST_INFINITY
1 - 1000000

Default Value: 5
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
   "1   �  �    Instrument Handle                "� > � �  �    Burst Count                      $H����  �    Status                           3" >  � �    Channel Name                           5    	           "1"    �    This function configures the burst mode.  The function decides whether the function generator produces a burst of waveform cycles when it receives a trigger or produces cycles of waveform when the trigger signal keeps high.
     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
    �    Sets the burst mode for the channel you specify. The driver sets the TKAFG1K_ATTR_BURST_MODE attribute to this value. 

Valid Values:
TKAFG1K_VAL_BURST_TRIGGER          - Triggered Mode                               
TKAFG1K_VAL_BURST_GATE             - Gated Mode

When you set this parameter to Triggered Mode, and when burst mode is enabled, the function generator produces cycles of waveform according to burst count in response to a trigger event.

When you set this parameter to Gated Mode, and when burst mode is enabled, the function generator produces cycles of waveform only when trigger signal is in high level.

Default Value: TKAFG1K_VAL_BURST_TRIGGER   6   �  �    Instrument Handle                6�����  �    Status                           E� >  � �    Channel Name                     F� > � � �    Burst Mode                             	           "1"               ATriggered TKAFG1K_VAL_BURST_TRIGGER Gated TKAFG1K_VAL_BURST_GATE    �    This function configures whether the function generator adds
noise signal to a channel.

Notes:
You could add internal noise simultaneously with external signal if adding external signal is applicable.     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
     �    Specify whether you want to add internal noise to an output signal for the channel you specify.

Valid Values:
VI_TRUE            - Enable Adding Noise (Default)
VI_FALSE           - Disable Adding Noise 

   KT   �  �    Instrument Handle                L����  �    Status                           Z� >  � �    Channel Name                     [� > � �       Noise Appendant Enabled                	           "1"   True 1 False 0    �    This function configures the internal noise level. 

Notes:
You could only use this function when operation mode is set to Continuous, Burst or Sweep mode.     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
     �    Passes noise level which applies to the output signal for the specified channel that you want the function generator to produce.

Units:  Percentage (%)

Valid Range:  0 - 50 %

Default Value: 10 %   ^q   �  �    Instrument Handle                _1����  �    Status                           n >  � �    Channel Name                     o > � �  �    Noise Level                            	           "1"    10   P    This function configures whether the function generator add
external signal to the channel you specify.

Notes: 
(1) This function is only applicable to AFG3100, AFG3200 series  and AFG2021 function generator.
Model       Applicable
--------------------------
AFG3021     NO
AFG3022     NO
AFG3101     YES
AFG3102     YES
AFG3251     YES
AFG3252     YES
AFG2021     YES

(2) This function is only applicable to CH1 output signal.

Model       Channel        Applicable
-----------------------------------------------
AFG3101     CH1            YES

AFG3102     CH1            YES
AFG3102     CH2            NO

AFG3251     CH1            YES

AFG3252     CH1            YES
AFG3252     CH2            NO

AFG2021     CH1            YES

(3) You could add external signal simultaneously with internal noise if adding external signal is applicable.     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
     �    Specify whether you want to add external signal to an output signal for the channel you specify.

Valid Values:
VI_TRUE            - Enable Adding External Signal (Default)
VI_FALSE           - Disable Adding External Signal

   t,   �  �    Instrument Handle                t�����  �    Status                           �� >  � �    Channel Name                     �� > � �       External Appendant Enabled             	           "1"   True 1 False 0    e    This function configures whether the function generator applies amplitude modulation to a channel.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
        Specify whether you want to enable or disable amplitude modulation for the channel.  The driver sets the TKAFG1K_ATTR_AM_ENABLED attribute to this value. 

Valid Values:
VI_TRUE  - Enable amplitude modulation  (Default)
VI_FALSE - Disable amplitude modulation
   �%����  �    Status                           �   �  �    Instrument Handle                �� >  � �    Channel Name                     �� > � � �    Enabled                            	               "1"   True VI_TRUE False VI_FALSE    �    This function configures the source the function generator uses to apply amplitude modulation to the channel's output signal.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
    C    Passes the source of the modulating signal you want to use.  The driver sets the TKAFG1K_ATTR_AM_SOURCE attribute to this value. 

Valid Values:
TKAFG1K_VAL_AM_INTERNAL - internal modulation source
TKAFG1K_VAL_AM_EXTERNAL - external modulation source

Default Value: 
TKAFG1K_VAL_AM_INTERNAL - internal modulation source
   �h����  �    Status                           �D   �  �    Instrument Handle                � >  � �    Channel Name                     � > � � �    Source                             	               "1"               BInternal TKAFG1K_VAL_AM_INTERNAL External TKAFG1K_VAL_AM_EXTERNAL   �    This function configures the attributes that control the function generator's internal amplitude modulation source.  These attributes are the modulation depth, waveform, and frequency.

This function is applicable only when the TKAFG1K_ATTR_AM_SOURCE attribute is set to TKAFG1K_VAL_AM_INTERNAL. 

Notes:
(1) This function is not based on channel. 

(2) You should configure AM source to internal before calling this function.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    n    Passes the waveform you want to use to modulate the output signal.  The driver sets the TKAFG1K_ATTR_AM_INTERNAL_WAVEFORM attribute to this value.
  
Defined Values:
TKAFG1K_VAL_AM_INTERNAL_SINE      - Sinusoid waveform 
TKAFG1K_VAL_AM_INTERNAL_SQUARE    - Square waveform 
TKAFG1K_VAL_AM_INTERNAL_TRIANGLE  - Triangle waveform
TKAFG1K_VAL_AM_INTERNAL_RAMP_UP   - Positive ramp waveform
TKAFG1K_VAL_AM_INTERNAL_RAMP_DOWN - Negative ramp waveform
TKAFG1K_VAL_AM_INTERNAL_PRN       - Noise waveform
TKAFG1K_VAL_AM_INTERNAL_USER1     - Arbitrary waveform 1
TKAFG1K_VAL_AM_INTERNAL_USER2     - Arbitrary waveform 2
TKAFG1K_VAL_AM_INTERNAL_USER3     - Arbitrary waveform 3
TKAFG1K_VAL_AM_INTERNAL_USER4     - Arbitrary waveform 4

Default Value:
TKAFG1K_VAL_AM_INTERNAL_SINE      - Sinusoid waveform 

Notes:

(1) You can use arbitrary waveform only when the waveform is available.     �    Passes the frequency at which you want the instrument to generate the modulating waveform.  The driver sets the TKAFG1K_ATTR_AM_INTERNAL_FREQUENCY attribute to this value.

Units: Hertz (Hz)

Valid Range:  0.002 - 50000.0 (Hz)

Default Value: 10000.0    �    Passes the percentage of full modulation you want to apply to the carrier signal.  The driver sets the TKAFG1K_ATTR_AM_INTERNAL_DEPTH attribute to this value.  At 0% depth, the output amplitude equals the carrier signal's amplitude.  At 100% depth, the output amplitude equals twice the carrier signal's amplitude.


Units: Percentage (%)

Valid Range:  0.00 - 120.00 (%)

Default Value: 50.00 (%)
   �G����  �    Status                           �#   �  �    Instrument Handle                �� > � � �    Modulation Waveform              �Y >j �  �    Modulation Frequency             �] >  �  �    Modulation Depth                   	                       
  �Sine TKAFG1K_VAL_AM_INTERNAL_SINE Square TKAFG1K_VAL_AM_INTERNAL_SQUARE Triangle TKAFG1K_VAL_AM_INTERNAL_TRIANGLE Ramp Up TKAFG1K_VAL_AM_INTERNAL_RAMP_UP Ramp Down TKAFG1K_VAL_AM_INTERNAL_RAMP_DOWN Noise TKAFG1K_VAL_AM_INTERNAL_PRN Arbitrary User1 TKAFG1K_VAL_AM_INTERNAL_USER1 Arbitrary User2 TKAFG1K_VAL_AM_INTERNAL_USER2 Arbitrary User3 TKAFG1K_VAL_AM_INTERNAL_USER3 Arbitrary User4 TKAFG1K_VAL_AM_INTERNAL_USER4    10000.0    50    �    This function configures the attributes that control the function generator's internal amplitude modulation source.  These attributes are the modulation depth, waveform, and frequency.

Notes:
This function is based on channel.     �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
     �    Passes the frequency at which you want the instrument to generate the modulating waveform.  The driver sets the TKAFG1K_ATTR_AM_INTERNAL_FREQUENCY attribute to this value.

Units: Hertz (Hz)

Valid Range:  0.002 - 50000.0 (Hz)

Default Value: 10000.0    �    Passes the percentage of full modulation you want to apply to the carrier signal.  The driver sets the TKAFG1K_ATTR_AM_INTERNAL_DEPTH attribute to this value.  At 0% depth, the output amplitude equals the carrier signal's amplitude.  At 100% depth, the output amplitude equals twice the carrier signal's amplitude.


Units: Percentage (%)

Valid Range:  0.00 - 120.00 (%)

Default Value: 50.0 (%)

    �    Passes the waveform you want to use to modulate the output signal.  The driver sets the TKAFG1K_ATTR_AM_INTERNAL_WAVEFORM attribute to this value.
  
Defined Values:
TKAFG1K_VAL_AM_INTERNAL_SINE      - Sinusoid waveform 
TKAFG1K_VAL_AM_INTERNAL_SQUARE    - Square waveform 
TKAFG1K_VAL_AM_INTERNAL_TRIANGLE  - Triangle waveform
TKAFG1K_VAL_AM_INTERNAL_RAMP_UP   - Positive ramp waveform
TKAFG1K_VAL_AM_INTERNAL_RAMP_DOWN - Negative ramp waveform
TKAFG1K_VAL_AM_INTERNAL_PRN       - Noise waveform
TKAFG1K_VAL_AM_INTERNAL_USER1     - Arbitrary waveform 1
TKAFG1K_VAL_AM_INTERNAL_USER2     - Arbitrary waveform 2
TKAFG1K_VAL_AM_INTERNAL_USER3     - Arbitrary waveform 3
TKAFG1K_VAL_AM_INTERNAL_USER4     - Arbitrary waveform 4
TKAFG1K_VAL_AM_INTERNAL_EMEM      - Edit Memory

Default Value:
TKAFG1K_VAL_AM_INTERNAL_SINE      - Sinusoid waveform 

Notes:
(1) You use arbitrary waveform only when the waveform is available.
(2) For AFG3kC series, Edit Memory is the same as Edit Memory 1 for channel 1 and Edit Memory 2 for channel 2 since firmware version 1.0.4.

SCPI Command:
[SOURce[1|2]]:AM:INTernal:FUNCtion {SINusoid|SQUare|TRIangle|RAMP|NRAMp|PRNoise|USER[1]|USER2|USER3|USER4|EMEMory|EMEMory1|EMEMory2|EFILe}     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
   ȼ����  �    Status                           ט   �  �    Instrument Handle                �X �j �  �    Modulation Frequency             �\ �  �  �    Modulation Depth                 �� � � � �    Modulation Waveform              ߻ >  � �    Channel Name                       	               10000.0    50.0              �Sine TKAFG1K_VAL_AM_INTERNAL_SINE Square TKAFG1K_VAL_AM_INTERNAL_SQUARE Triangle TKAFG1K_VAL_AM_INTERNAL_TRIANGLE Ramp Up TKAFG1K_VAL_AM_INTERNAL_RAMP_UP Ramp Down TKAFG1K_VAL_AM_INTERNAL_RAMP_DOWN Noise TKAFG1K_VAL_AM_INTERNAL_PRN Arbitrary User1 TKAFG1K_VAL_AM_INTERNAL_USER1 Arbitrary User2 TKAFG1K_VAL_AM_INTERNAL_USER2 Arbitrary User3 TKAFG1K_VAL_AM_INTERNAL_USER3 Arbitrary User4 TKAFG1K_VAL_AM_INTERNAL_USER4 Edit Memory TKAFG1K_VAL_AM_INTERNAL_EMEM    "1"    �    This function configures the attribute that control the function generator's external amplitude modulation source.  This attribute is the modulation depth.

Notes:
This function is not channel-based.     �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Passes the percentage of full modulation you want to apply to the carrier signal.  The driver sets the TKAFG1K_ATTR_AM_INTERNAL_DEPTH attribute to this value.  At 0% depth, the output amplitude equals the carrier signal's amplitude.  At 100% depth, the output amplitude equals twice the carrier signal's amplitude.


Units: Percentage (%)

Valid Range:  0.00 - 120.00 (%)

Default Value: 50.0 (%)     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
   ������  �    Status                           �   �  �    Instrument Handle                �p > � �  �    Modulation Depth                 � >  � �    Channel Name                       	               50.0    "1"    e    This function configures whether the function generator applies frequency modulation to a channel.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
        Specifies whether you want to enable or disable frequency modulation for the channel.  The driver sets the TKAFG1K_ATTR_FM_ENABLED attribute to this value. 

Valid Values:
VI_TRUE  - Enable frequency modulation  (Default)
VI_FALSE - Disable frequency modulation
   �m����  �    Status                           I   �  �    Instrument Handle                	 >  � �    Channel Name                     	 > � � �    Enabled                            	               "1"   True VI_TRUE False VI_FALSE    �    This function configures the source the function generator uses to apply frequency modulation to the channel's output signal.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
    C    Passes the source of the modulating signal you want to use.  The driver sets the TKAFG1K_ATTR_FM_SOURCE attribute to this value. 

Valid Values:
TKAFG1K_VAL_FM_INTERNAL - internal modulation source
TKAFG1K_VAL_FM_EXTERNAL - external modulation source

Default Value: 
TKAFG1K_VAL_FM_INTERNAL - internal modulation source
   �����  �    Status                           �   �  �    Instrument Handle                N >  � �    Channel Name                     U > � � �    Source                             	               "1"               BInternal TKAFG1K_VAL_FM_INTERNAL External TKAFG1K_VAL_FM_EXTERNAL   �    This function configures the attributes that control the function generator's internal frequency modulation source.  These attributes are the peak deviation, waveform, and frequency.

This function is applicable only when the TKAFG1K_ATTR_FM_SOURCE attribute is set to TKAFG1K_VAL_FM_INTERNAL. 

Notes:
(1) This function is not based on channel.

(2) You should configure FM source to internal before calling this function.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    }    Passes the waveform you want to use to modulate the output signal.  The driver sets the TKAFG1K_ATTR_FM_INTERNAL_WAVEFORM attribute to this value.
  
Defined Values:
TKAFG1K_VAL_FM_INTERNAL_SINE      - Sinusoid waveform
TKAFG1K_VAL_FM_INTERNAL_SQUARE    - Square waveform 
TKAFG1K_VAL_FM_INTERNAL_TRIANGLE  - Triangle waveform
TKAFG1K_VAL_FM_INTERNAL_RAMP_UP   - Positive ramp waveform
TKAFG1K_VAL_FM_INTERNAL_RAMP_DOWN - Negative ramp waveform
TKAFG1K_VAL_FM_INTERNAL_PRN       - Noise waveform
TKAFG1K_VAL_FM_INTERNAL_USER1     - Arbitrary waveform 1                     TKAFG1K_VAL_FM_INTERNAL_USER2     - Arbitrary waveform 2
TKAFG1K_VAL_FM_INTERNAL_USER3     - Arbitrary waveform 3
TKAFG1K_VAL_FM_INTERNAL_USER4     _ Arbitrary waveform 4

Default Value:
TKAFG1K_VAL_FM_INTERNAL_SINE      - Sinusoid waveform

Notes:

(1) You use arbitrary waveform only when the waveform is available.
    �    Passes the maximum frequency deviation you want the function generator to apply to the carrier waveform.  This deviation corresponds to the maximum amplitude level of the modulating signal.  The driver sets the TKAFG1K_ATTR_FM_INTERNAL_DEVIATION attribute to this value.

Units: Hertz (Hz)

Valid Range:  
The valid range of frequency deviation is decided by instrument model and carrier waveform shape.

Model               Waveform         Valid Range
-------------------------------------------------------
AFG3011             SINE             0 - 5M     (Hz)
AFG3011             SQUARE           0 - 2.5M   (Hz)
AFG3011             RAMP             0 - 50K    (Hz)
AFG3011             Advanced Shape   0 - 50K    (Hz)   
AFG3011             Arbitrary        0 - 2.5M   (Hz)

AFG3021/AFG3022     SINE             0 - 12.5M  (Hz)
AFG3021/AFG3022     SQUARE           0 - 6.25M  (Hz)
AFG3021/AFG3022     RAMP             0 - 125k   (Hz)
AFG3021/AFG3022     Advanced Shape   0 - 125k   (Hz)
AFG3021/AFG3022     Arbitrary        0 - 6.25M  (Hz)

AFG3101/AFG3102     SINE             0 - 50M    (Hz)
AFG3101/AFG3102     SQUARE           0 - 25M    (Hz)
AFG3101/AFG3102     RAMP             0 - 0.5M   (Hz)
AFG3101/AFG3102     Advanced Shape   0 - 0.5M   (Hz)
AFG3101/AFG3102     Arbitrary        0 - 25M    (Hz)

AFG3251/AFG3252     SINE             0 - 120M   (Hz)
AFG3251/AFG3252     SQUARE           0 - 60M    (Hz)
AFG3251/AFG3252     RAMP             0 - 1.2M   (Hz)
AFG3251/AFG3252     Advanced Shape   0 - 1.2M   (Hz)   
AFG3251/AFG3252     Arbitrary        0 - 60M    (Hz)          

AFG2021             SINE             0 - 10M    (Hz)
AFG2021             SQUARE           0 - 5M     (Hz)
AFG2021             RAMP             0 - 125K   (Hz)
AFG2021             Advanced Shape   0 - 125K   (Hz)   
AFG2021             Arbitrary        0 - 5M     (Hz)

Except for the valid range above, be sure that the deviation value meets the following formula when you set frequency deviation:
(1)  frequency deviation <= carrier waveform frequency
(2)  frequency deviation + carrier waveform frequency 
                           <= maximum carrier waveform frequency


Default Value: 1 M (Hz)
     �    Passes the frequency of the internal modulating signal.  The driver sets the TKAFG1K_ATTR_FM_INTERNAL_FREQUENCY attribute to this value.

Units: Hertz (Hz)

Valid Range:  0.002 - 50000 (Hz)

Default Value: 10000 (Hz)    �����  �    Status                           /g   �  �    Instrument Handle                0' > � � �    Modulation Waveform              3� >  �  �    Peak Deviation (Hz)              <C >j �  �    Modulation Frequency (Hz)          	                       
  �Sine TKAFG1K_VAL_FM_INTERNAL_SINE Square TKAFG1K_VAL_FM_INTERNAL_SQUARE Triangle TKAFG1K_VAL_FM_INTERNAL_TRIANGLE Ramp Up TKAFG1K_VAL_FM_INTERNAL_RAMP_UP Ramp Down TKAFG1K_VAL_FM_INTERNAL_RAMP_DOWN Noise TKAFG1K_VAL_FM_INTERNAL_PRN Arbitrary User1 TKAFG1K_VAL_FM_INTERNAL_USER1 Arbitrary User2 TKAFG1K_VAL_FM_INTERNAL_USER2 Arbitrary User3 TKAFG1K_VAL_FM_INTERNAL_USER3 Arbitrary User4 TKAFG1K_VAL_FM_INTERNAL_USER4    1000000    10000    �    This function configures the attributes that control the function generator's internal frequency modulation source.  These attributes are the peak deviation, waveform, and frequency.

Notes:
This function is based on channel.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Passes the maximum frequency deviation you want the function generator to apply to the carrier waveform.  This deviation corresponds to the maximum amplitude level of the modulating signal.  The driver sets the TKAFG1K_ATTR_FM_INTERNAL_DEVIATION attribute to this value.

Units: Hertz (Hz)

Valid Range:  
The valid range of frequency deviation is decided by instrument model and carrier waveform shape.

Model               Waveform         Valid Range
-------------------------------------------------------
AFG3011             SINE             0 - 5M     (Hz)
AFG3011             SQUARE           0 - 2.5M   (Hz)
AFG3011             RAMP             0 - 50K    (Hz)
AFG3011             Advanced Shape   0 - 50K    (Hz)   
AFG3011             Arbitrary        0 - 2.5M   (Hz)

AFG3021/AFG3022     SINE             0 - 12.5M  (Hz)
AFG3021/AFG3022     SQUARE           0 - 6.25M  (Hz)
AFG3021/AFG3022     RAMP             0 - 125k   (Hz)
AFG3021/AFG3022     Advanced Shape   0 - 125k   (Hz)
AFG3021/AFG3022     Arbitrary        0 - 6.25M  (Hz)

AFG3101/AFG3102     SINE             0 - 50M    (Hz)
AFG3101/AFG3102     SQUARE           0 - 25M    (Hz)
AFG3101/AFG3102     RAMP             0 - 0.5M   (Hz)
AFG3101/AFG3102     Advanced Shape   0 - 0.5M   (Hz)
AFG3101/AFG3102     Arbitrary        0 - 25M    (Hz)

AFG3251/AFG3252     SINE             0 - 120M   (Hz)
AFG3251/AFG3252     SQUARE           0 - 60M    (Hz)
AFG3251/AFG3252     RAMP             0 - 1.2M   (Hz)
AFG3251/AFG3252     Advanced Shape   0 - 1.2M   (Hz)   
AFG3251/AFG3252     Arbitrary        0 - 60M    (Hz)          

AFG2021             SINE             0 - 10M    (Hz)
AFG2021             SQUARE           0 - 5M     (Hz)
AFG2021             RAMP             0 - 125K   (Hz)
AFG2021             Advanced Shape   0 - 125K   (Hz)   
AFG2021             Arbitrary        0 - 5M     (Hz)

Except for the valid range above, be sure that the deviation value meets the following formula when you set frequency deviation:
(1)  frequency deviation <= carrier waveform frequency
(2)  frequency deviation + carrier waveform frequency 
                           <= maximum carrier waveform frequency


Default Value: 1 M (Hz)
     �    Passes the frequency of the internal modulating signal.  The driver sets the TKAFG1K_ATTR_FM_INTERNAL_FREQUENCY attribute to this value.

Units: Hertz (Hz)

Valid Range:  0.002 - 50000 (Hz)

Default Value: 10000 (Hz)     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
    �    Passes the waveform you want to use to modulate the output signal.  The driver sets the TKAFG1K_ATTR_FM_INTERNAL_WAVEFORM attribute to this value.
  
Defined Values:
TKAFG1K_VAL_FM_INTERNAL_SINE      - Sinusoid waveform
TKAFG1K_VAL_FM_INTERNAL_SQUARE    - Square waveform 
TKAFG1K_VAL_FM_INTERNAL_TRIANGLE  - Triangle waveform
TKAFG1K_VAL_FM_INTERNAL_RAMP_UP   - Positive ramp waveform
TKAFG1K_VAL_FM_INTERNAL_RAMP_DOWN - Negative ramp waveform
TKAFG1K_VAL_FM_INTERNAL_PRN       - Noise waveform
TKAFG1K_VAL_FM_INTERNAL_USER1     - Arbitrary waveform 1                     TKAFG1K_VAL_FM_INTERNAL_USER2     - Arbitrary waveform 2
TKAFG1K_VAL_FM_INTERNAL_USER3     - Arbitrary waveform 3
TKAFG1K_VAL_FM_INTERNAL_USER4     - Arbitrary waveform 4
TKAFG1K_VAL_FM_INTERNAL_EMEM      - Edit Memory

Default Value:
TKAFG1K_VAL_FM_INTERNAL_SINE      - Sinusoid waveform

Notes:
(1) You use arbitrary waveform only when the waveform is available.
(2) For AFG3kC series, Edit Memory is the same as Edit Memory 1 for channel 1 and Edit Memory 2 for channel 2 since firmware version 1.0.4.

SCPI Command:
[SOURce[1|2]]:FM:INTernal:FUNCtion {SINusoid|SQUare|TRIangle|RAMP|NRAMp|PRNoise|USER[1]|USER2|USER3|USER4|EMEMory|EMEMory1|EMEMory2|EFILe}   @�����  �    Status                           O�   �  �    Instrument Handle                P� �  �  �    Peak Deviation (Hz)              Y �j �  �    Modulation Frequency (Hz)        Z  >  � �    Channel Name                     [ � � � �    Modulation Waveform                	               1000000    10000    "1"              �Sine TKAFG1K_VAL_FM_INTERNAL_SINE Square TKAFG1K_VAL_FM_INTERNAL_SQUARE Triangle TKAFG1K_VAL_FM_INTERNAL_TRIANGLE Ramp Up TKAFG1K_VAL_FM_INTERNAL_RAMP_UP Ramp Down TKAFG1K_VAL_FM_INTERNAL_RAMP_DOWN Noise TKAFG1K_VAL_FM_INTERNAL_PRN Arbitrary User1 TKAFG1K_VAL_FM_INTERNAL_USER1 Arbitrary User2 TKAFG1K_VAL_FM_INTERNAL_USER2 Arbitrary User3 TKAFG1K_VAL_FM_INTERNAL_USER3 Arbitrary User4 TKAFG1K_VAL_FM_INTERNAL_USER4 Edit Memory TKAFG1K_VAL_FM_INTERNAL_EMEM    �    This function configures the attribute that controls the function generator's external frequency modulation source.  The attribute is the peak deviation.

Notes:
This function is based on channel.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    The ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Pass the maximum frequency deviation you want the function generator to apply to the carrier waveform.  This deviation corresponds to the maximum amplitude level of the modulating signal.  The driver sets the TKAFG1K_ATTR_FM_INTERNAL_DEVIATION attribute to this value.

Units: Hertz (Hz)

Valid Range:  
The valid range of frequency deviation is decided by instrument model and carrier waveform shape.

Model               Waveform         Valid Range
-------------------------------------------------------
AFG3021/AFG3022     SINE             0 - 12.5M  (Hz)
AFG3021/AFG3022     SQUARE           0 - 6.25M  (Hz)
AFG3021/AFG3022     RAMP             0 - 125k   (Hz)
AFG3021/AFG3022     Advanced Shape   0 - 125k   (Hz)
AFG3021/AFG3022     Arbitrary        0 - 6.25M  (Hz)

AFG3101/AFG3102     SINE             0 - 50M    (Hz)
AFG3101/AFG3102     SQUARE           0 - 25M    (Hz)
AFG3101/AFG3102     RAMP             0 - 0.5M   (Hz)
AFG3101/AFG3102     Advanced Shape   0 - 0.5M   (Hz)
AFG3101/AFG3102     Arbitrary        0 - 25M    (Hz)

AFG3251/AFG3252     SINE             0 - 120M   (Hz)
AFG3251/AFG3252     SQUARE           0 - 60M    (Hz)
AFG3251/AFG3252     RAMP             0 - 1.2M   (Hz)
AFG3251/AFG3252     Advanced Shape   0 - 1.2M   (Hz)   
AFG3251/AFG3252     Arbitrary        0 - 60M    (Hz)          

AFG2021             SINE             0 - 20M    (Hz)
AFG2021             SQUARE           0 - 10M    (Hz)
AFG2021             RAMP             0 - 200K   (Hz)
AFG2021             Advanced Shape   0 - 200K   (Hz)   
AFG2021             Arbitrary        0 - 10M    (Hz)

Besides valid range above, actually, when you set frequency deviation, be sure that the deviation value meets the following formula:
(1)  frequency deviation <= carrier waveform frequency
(2)  frequency deviation + carrier waveform frequency 
                           <= maximum carrier waveform frequency


Default Value: 1 M (Hz)     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
   c�����  �    Status                           r�   �  �    Instrument Handle                s� > � �  �    Peak Deviation (Hz)              { >  � �    Channel Name                       	               1000000    "1"    �    Pass whether you want to enable or disable phase modulation for the channel.  The driver sets the TKAFG1K_ATTR_PM_ENABLED attribute to this value. 

Valid Values:
VI_TRUE  - Enable phase modulation  (Default)
VI_FALSE - Disable phase modulation    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    The ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
        Pass whether you want to enable or disable frequency modulation for the channel.  The driver sets the TKAFG1K_ATTR_FM_ENABLED attribute to this value. 

Valid Values:
VI_TRUE  - Enable frequency modulation  (Default)
VI_FALSE - Disable frequency modulation
   ~����  �    Status                           ��   �  �    Instrument Handle                �� >  � �    Channel Name                     �� > � � �    Enabled                            	               "1"   True VI_TRUE False VI_FALSE    {    This function configures the source the function generator uses to apply phase modulation to the channel's output signal.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    The ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
    A    Pass the source of the modulating signal you want to use.  The driver sets the TKAFG1K_ATTR_PM_SOURCE attribute to this value. 

Valid Values:
TKAFG1K_VAL_PM_INTERNAL - internal modulation source
TKAFG1K_VAL_PM_EXTERNAL - external modulation source

Default Value: 
TKAFG1K_VAL_PM_INTERNAL - internal modulation source
   �9����  �    Status                           �   �  �    Instrument Handle                �� >  � �    Channel Name                     �� > � � �    Source                             	               "1"               BInternal TKAFG1K_VAL_PM_INTERNAL External TKAFG1K_VAL_PM_EXTERNAL    �    This function configures the attributes that control the function generator's internal phase modulation source.  These attributes are the peak deviation, waveform, and frequency.

Notes:
This function is based on channel.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    The ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
        Pass the maximum phase deviation you want the function generator to apply to the carrier waveform.  The driver sets the TKAFG1K_ATTR_PM_INTERNAL_DEVIATION attribute to this value.

Units: Degree

Valid Range:  0 - 180 (Degree)

Default Value: 90 (Degree)
     �    Pass the frequency of the internal modulating signal.  The driver sets the TKAFG1K_ATTR_PM_INTERNAL_FREQUENCY attribute to this value.

Units: Hertz (Hz)

Valid Range:  0.002 - 50000 (Hz)

Default Value: 10000 (Hz)    �    Pass the waveform you want to use to modulate the output signal.  The driver sets the TKAFG1K_ATTR_PM_INTERNAL_WAVEFORM attribute to this value.
  
Defined Values:
TKAFG1K_VAL_PM_INTERNAL_SINE      - Sinusoid waveform
TKAFG1K_VAL_PM_INTERNAL_SQUARE    - Square waveform 
TKAFG1K_VAL_PM_INTERNAL_TRIANGLE  - Triangle waveform
TKAFG1K_VAL_PM_INTERNAL_RAMP_UP   - Positive ramp waveform
TKAFG1K_VAL_PM_INTERNAL_RAMP_DOWN - Negative ramp waveform
TKAFG1K_VAL_PM_INTERNAL_PRN       - Noise waveform
TKAFG1K_VAL_PM_INTERNAL_USER1     - Arbitrary waveform 1
TKAFG1K_VAL_PM_INTERNAL_USER2     - Arbitrary waveform 2
TKAFG1K_VAL_PM_INTERNAL_USER3     - Arbitrary waveform 3
TKAFG1K_VAL_PM_INTERNAL_USER4     - Arbitrary waveform 4
TKAFG1K_VAL_PM_INTERNAL_EMEM      - Edit Memory

Default Value:
TKAFG1K_VAL_PM_INTERNAL_SINE      - Sinusoid waveform

Notes:
(1) You could use arbitrary waveform only when the waveform is available.
(2) For AFG 3KC series, Edit Memory is the same as Edit Memory 1 for channel 1 and Edit Memory 2 for channel 2 since firmware version 1.0.4.

SCPI Command:
[SOURce[1|2]]:PM:INTernal:FUNCtion {SINusoid|SQUare|TRIangle|RAMP|NRAMp|PRNoise|USER[1]|USER2|USER3|USER4|EMEMory|EMEMory1|EMEMory2|EFILe}   �>����  �    Status                           �   �  �    Instrument Handle                �� >  � �    Channel Name                     �� �  �  �    Peak Deviation                   �� �j �  �    Modulation Frequency (Hz)        �� � � � �    Modulation Waveform                	               "1"    90    10000              �Sine TKAFG1K_VAL_PM_INTERNAL_SINE Square TKAFG1K_VAL_PM_INTERNAL_SQUARE Triangle TKAFG1K_VAL_PM_INTERNAL_TRIANGLE Ramp Up TKAFG1K_VAL_PM_INTERNAL_RAMP_UP Ramp Down TKAFG1K_VAL_PM_INTERNAL_RAMP_DOWN Noise TKAFG1K_VAL_PM_INTERNAL_PRN Arbitrary User1 TKAFG1K_VAL_PM_INTERNAL_USER1 Arbitrary User2 TKAFG1K_VAL_PM_INTERNAL_USER2 Arbitrary User3 TKAFG1K_VAL_PM_INTERNAL_USER3 Arbitrary User4 TKAFG1K_VAL_PM_INTERNAL_USER4 Edit Memory TKAFG1K_VAL_PM_INTERNAL_EMEM    �    This function configures the attributes that control the function generator's external phase modulation source.  These attributes are the peak deviations.

Notes:
This function is based on channel.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Passes the maximum phase deviation you want the function generator to apply to the carrier waveform.  The driver sets the TKAFG1K_ATTR_PM_INTERNAL_DEVIATION attribute to this value.

Units: Degree

Valid Range:  0 - 180 (Degree)

Default Value: 90 (Degree)
     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
   ������  �    Status                           �o   �  �    Instrument Handle                �/ > � �  �    Peak Deviation                   �: >  � �    Channel Name                       	               90    "1"    ^    This function configures whether the function generator applies FSK modulation to a channel.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
     �    Specifies whether you want to enable or disable FSK modulation for the channel.  The driver sets the TKAFG1K_ATTR_FSK_ENABLED attribute to this value. 

Valid Values:
VI_TRUE  - Enable FSK modulation  (Default)
VI_FALSE - Disable FSK modulation

   Ә����  �    Status                           �r   �  �    Instrument Handle                �2 >  � �    Channel Name                     �9 > � � �    Enabled                            	               "1"   True VI_TRUE False VI_FALSE    y    This function configures the source the function generator uses to apply FSK modulation to the channel's output signal.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
    F    Passes the source of the modulating signal you want to use.  The driver sets the TKAFG1K_ATTR_FSK_SOURCE attribute to this value. 

Valid Values:
TKAFG1K_VAL_FSK_INTERNAL - internal modulation source
TKAFG1K_VAL_FSK_EXTERNAL - external modulation source

Default Value: 
TKAFG1K_VAL_FSK_INTERNAL - internal modulation source   ������  �    Status                           ��   �  �    Instrument Handle                �^ >  � �    Channel Name                     �e > � � �    Source                             	               "1"               DInternal TKAFG1K_VAL_FSK_INTERNAL External TKAFG1K_VAL_FSK_EXTERNAL    �    This function configures the attributes that control the function generator's internal FSK modulation source.  These attributes are the hop frequency and internal rate.

Notes:
This function is based on channel.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
    �    Passes the hop frequency of FSK modulation for the channel you specify.  The driver sets the TKAFG1K_ATTR_FSK_HOP_FREQUENCY attribute to this value.

Units: Hertz (Hz)

Valid Range: 
The valid range of hop frequency is decided by instrument model and carrier waveform shape.

Model               Waveform         Valid Range
-------------------------------------------------------
AFG3011             SINE             1u - 10M     (Hz)
AFG3011             SQUARE           1u - 5M      (Hz)
AFG3011             RAMP             1u - 100k    (Hz)
AFG3011             Advanced Shape   1u - 100k    (Hz)
AFG3011             Arbitrary        1m - 5M      (Hz)

AFG3021/AFG3022     SINE             1u - 25M     (Hz)
AFG3021/AFG3022     SQUARE           1u - 12.5M   (Hz)
AFG3021/AFG3022     RAMP             1u - 250k    (Hz)
AFG3021/AFG3022     Advanced Shape   1u - 250k    (Hz)
AFG3021/AFG3022     Arbitrary        1m - 12.5M   (Hz)

AFG3101/AFG3102     SINE             1u - 100M    (Hz)
AFG3101/AFG3102     SQUARE           1u - 50M     (Hz)
AFG3101/AFG3102     RAMP             1u - 1M      (Hz)
AFG3101/AFG3102     Advanced Shape   1u - 1M      (Hz)
AFG3101/AFG3102     Arbitrary        1m - 50M     (Hz)

AFG3251/AFG3252     SINE             1u - 240M    (Hz)
AFG3251/AFG3252     SQUARE           1u - 120M    (Hz)
AFG3251/AFG3252     RAMP             1u - 2.4M    (Hz)
AFG3251/AFG3252     Advanced Shape   1u - 2.4M    (Hz) 
AFG3251/AFG3252     Arbitrary        1m - 120M    (Hz)  

AFG2021             SINE             1u - 20M     (Hz)
AFG2021             SQUARE           1u - 10M     (Hz)
AFG2021             RAMP             1u - 200k    (Hz)
AFG2021             Advanced Shape   1u - 200k    (Hz)
AFG2021             Arbitrary        1m - 10M     (Hz)

Default Value: 1 M (Hz)     �    Passes the internal modulation rate of FSK modulation for the channel you specify. The driver sets the TKAFG1K_ATTR_FSK_INTERNAL_RATE attribute to this value.

Units:  Hz

Valid Range:  0.002 - 1000000  (Hz)

Default Value:  50  (Hz)   ������  �    Status                           	�   �  �    Instrument Handle                
h >  � �    Channel Name                     o > � �  �    Hop Frequency                    t >j �  �    Internal Rate                      	               "1"    1000000    50    �    This function configures the attributes that control the function generator's external FSK modulation source.  These attributes are the hop frequency and internal rate.

Notes:
This function is based on channel.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
    J    Passes the hop frequency of FSK modulation for the channel you specify.  The driver sets the TKAFG1K_ATTR_FSK_HOP_FREQUENCY attribute to this value.

Units: Hertz (Hz)

Valid Range: 
The valid range of hop frequency is decided by instrument model and carrier waveform shape.

Model               Waveform         Valid Range
-------------------------------------------------------
AFG3021/AFG3022     SINE             0.01 - 25M     (Hz)
AFG3021/AFG3022     SQUARE           0.01 - 12.5M   (Hz)
AFG3021/AFG3022     RAMP             0.01 - 250k    (Hz)
AFG3021/AFG3022     Advanced Shape   0.01 - 250k    (Hz)
AFG3021/AFG3022     Arbitrary        0.01 - 12.5M   (Hz)

AFG3101/AFG3102     SINE             0.01 - 100M    (Hz)
AFG3101/AFG3102     SQUARE           0.01 - 50M     (Hz)
AFG3101/AFG3102     RAMP             0.01 - 1M      (Hz)
AFG3101/AFG3102     Advanced Shape   0.01 - 1M      (Hz)
AFG3101/AFG3102     Arbitrary        0.01 - 50M     (Hz)

AFG3251/AFG3252     SINE             0.01 - 240M    (Hz)
AFG3251/AFG3252     SQUARE           0.01 - 120M    (Hz)
AFG3251/AFG3252     RAMP             0.01 - 2.4M    (Hz)
AFG3251/AFG3252     Advanced Shape   0.01 - 2.4M    (Hz) 
AFG3251/AFG3252     Arbitrary        0.01 - 120M    (Hz)  

AFG2021             SINE             0.01 - 20M     (Hz)
AFG2021             SINE(Burst Mode) 0.01 - 10M     (Hz)
AFG2021             SQUARE           0.01 - 10M     (Hz)
AFG2021             RAMP             0.01 - 200k    (Hz)
AFG2021             PULSE            0.01 - 10M     (Hz)
AFG2021             Advanced Shape   0.01 - 200k    (Hz)

Default Value: 1 M (Hz)   u����  �    Status                           $O   �  �    Instrument Handle                % >  � �    Channel Name                     & > � �  �    Hop Frequency                      	               "1"    1000000    f    This function configures whether the function generator applies pulse width modulation to a channel.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
         Specifies whether you want to enable or disable pulse width modulation for the channel.  The driver sets the TKAFG1K_ATTR_PWM_ENABLED attribute to this value. 

Valid Values:
VI_TRUE  - Enable PWM modulation  (Default)
VI_FALSE - Disable PWM modulation

   -�����  �    Status                           <�   �  �    Instrument Handle                =f >  � �    Channel Name                     >m > � � �    Enabled                            	               "1"   True VI_TRUE False VI_FALSE    �    This function configures the source the function generator uses to apply pulse width modulation to the channel's output signal.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
    F    Passes the source of the modulating signal you want to use.  The driver sets the TKAFG1K_ATTR_PWM_SOURCE attribute to this value. 

Valid Values:
TKAFG1K_VAL_PWM_INTERNAL - internal modulation source
TKAFG1K_VAL_PWM_EXTERNAL - external modulation source

Default Value: 
TKAFG1K_VAL_PWM_INTERNAL - internal modulation source   A����  �    Status                           O�   �  �    Instrument Handle                P� >  � �    Channel Name                     Q� > � � �    Source                             	               "1"               DInternal TKAFG1K_VAL_PWM_INTERNAL External TKAFG1K_VAL_PWM_EXTERNAL    �    This function configures the attributes that control the function generator's internal pulse width modulation source.  These attributes are the peak deviation, modulation waveform and modulation frequency.

Notes:
This function is based on channel.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
    �    Passes the duty cycle deviation in percent for the channel you specify. The driver sets the TKAFG1K_ATTR_PWM_DEVIATION attribute to this value.

Units:  Percentage (%)

Valid Range: 0 - 100 %

Except for the valid range, be sure to meet the following formulas when you set duty cycle deviation:

(1) Deviation <= Pulse Width - Minimum Pulse Width
(2) Deviation <= Pulse Period - Pulse Width - 
                 Minimum Pulse Width
(3) Deviation <= Pulse Width - 0.8*(Leading Edge Time + 
                 Trailing Edge Time)
(4) Deviation <= Pulse Period - Pulse Width - 0.8*(
                 Leading Edge Time + Trailing Edge Time)

Default Value: 5.0 %
     �    Passes the frequency of the internal modulating signal.  The driver sets the TKAFG1K_ATTR_PWM_INTERNAL_FREQUENCY attribute to this value.

Units: Hertz (Hz)

Valid Range:  0.002 - 50000 (Hz)

Default Value: 10000 (Hz)    �    Passes the waveform you want to use to modulate the output signal.  The driver sets the TKAFG1K_ATTR_PWM_INTERNAL_WAVEFORM attribute to this value.
  
Defined Values:
TKAFG1K_VAL_PWM_INTERNAL_SINE          - Sinusoid waveform               
TKAFG1K_VAL_PWM_INTERNAL_SQUARE        - Square waveform                
TKAFG1K_VAL_PWM_INTERNAL_TRIANGLE      - Triangle waveform                  
TKAFG1K_VAL_PWM_INTERNAL_RAMP_UP       - Positive ramp waveform               
TKAFG1K_VAL_PWM_INTERNAL_RAMP_DOWN     - Negative ramp waveform              
TKAFG1K_VAL_PWM_INTERNAL_PRN           - Noise waveform
TKAFG1K_VAL_PWM_INTERNAL_USER1         - Arbitrary waveform 1
TKAFG1K_VAL_PWM_INTERNAL_USER2         - Arbitrary waveform 2
TKAFG1K_VAL_PWM_INTERNAL_USER3         - Arbitrary waveform 3
TKAFG1K_VAL_PWM_INTERNAL_USER4         - Arbitrary waveform 4
TKAFG1K_VAL_PWM_INTERNAL_EMEM          - Edit Memory

Default Value:
TKAFG1K_VAL_PWM_INTERNAL_SINE          - Sinusoid waveform

Note:
(1) Only Edit Memory is available for AFG 3K, AFG 3KB and AFG 3KC( firmware version is less than 1.0.4 ).
(2) Edit Memory 2 is supported since AFG 3KC firmware version 1.0.4 and only available on dual-channel models.
(3) For AFG3kC series, Edit Memory is the same as Edit Memory 1 for channel 1 and Edit Memory 2 for channel 2 since firmware version 1.0.4.

SCPI Command:
[SOURce[1|2]]:PWM:INTernal:FUNCtion {SINusoid|SQUare|TRIangle|RAMP|NRAMp|PRNoise|USER[1]|USER2|USER3|USER4|EMEMory|EMEMory1|EMEMory2|EFILe}   U7����  �    Status                           d   �  �    Instrument Handle                d� >  � �    Channel Name                     e� �  �  �    Peak Deviation (Hz)              ht �j �  �    Modulation Frequency (Hz)        iW � � � �    Modulation Waveform                	               "1"    5.0    10000              �Sine TKAFG1K_VAL_PWM_INTERNAL_SINE Square TKAFG1K_VAL_PWM_INTERNAL_SQUARE Triangle TKAFG1K_VAL_PWM_INTERNAL_TRIANGLE Ramp Up TKAFG1K_VAL_PWM_INTERNAL_RAMP_UP Ramp Down TKAFG1K_VAL_PWM_INTERNAL_RAMP_DOWN Noise TKAFG1K_VAL_PWM_INTERNAL_PRN Arbitrary User1 TKAFG1K_VAL_PWM_INTERNAL_USER1 Arbitrary User2 TKAFG1K_VAL_PWM_INTERNAL_USER2 Arbitrary User3 TKAFG1K_VAL_PWM_INTERNAL_USER3 Arbitrary User4 TKAFG1K_VAL_PWM_INTERNAL_USER4 Edit Memory TKAFG1K_VAL_PWM_INTERNAL_EMEM    �    This function configures the attribute that controls the function generator's external pulse width modulation source.  The attribute is the peak deviation.

Notes:
This function is based on channel.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
    �    Passes the duty cycle deviation in percent for the channel you specify. The driver sets the TKAFG1K_ATTR_PWM_DEVIATION attribute to this value.

Units:  Percentage (%)

Valid Range: 0 - 50 %

Except for the valid range, be sure to meet the following formulas when you set duty cycle deviation:

(1) Deviation <= Pulse Width - Minimum Pulse Width
(2) Deviation <= Pulse Period - Pulse Width - 
                 Minimum Pulse Width
(3) Deviation <= Pulse Width - 0.8*(Leading Edge Time + 
                 Trailing Edge Time)
(4) Deviation <= Pulse Period - Pulse Width - 0.8*(
                 Leading Edge Time + Trailing Edge Time)

Default Value: 5.0 %   sS����  �    Status                           �/   �  �    Instrument Handle                �� >  � �    Channel Name                     �� > � �  �    Peak Deviation (Percent)           	               "1"    5.0    �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
         Specifies whether you want to enable or disable pulse width modulation for the channel.  The driver sets the TKAFG1K_ATTR_PWM_ENABLED attribute to this value. 

Valid Values:
VI_TRUE  - Enable PWM modulation  (Default)
VI_FALSE - Disable PWM modulation

     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors   �� > 
  � �    Channel Name                     �� > � � �    Enabled                          ��$  �  �    Instrument Handle                �OZ���  �    Status                             "1"   True VI_TRUE False VI_FALSE        	           �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
    F    Passes the source of the modulating signal you want to use.  The driver sets the TKAFG1K_ATTR_FSK_SOURCE attribute to this value. 

Valid Values:
TKAFG1K_VAL_FSK_INTERNAL - internal modulation source
TKAFG1K_VAL_FSK_EXTERNAL - external modulation source

Default Value: 
TKAFG1K_VAL_FSK_INTERNAL - internal modulation source   �3   �  �    Instrument Handle                ��y���  �    Status                           �� 4  � �    Channel Name                     �� 5 � � �    Source                                 	           "1"               DInternal TKAFG1K_VAL_FSK_INTERNAL External TKAFG1K_VAL_FSK_EXTERNAL    �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
     �    Passes the internal modulation rate of FSK modulation for the channel you specify. The driver sets the TKAFG1K_ATTR_FSK_INTERNAL_RATE attribute to this value.

Units:  Hz

Valid Range:  0.002 - 1000000  (Hz)

Default Value:  50  (Hz)   �`   �  �    Instrument Handle                � ����  �    Status                           �� D  � �    Channel Name                     � Ij �  �    Internal Rate                   ���� H � �  �    Amplitude                              	           "1"    50    0    �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
   �   �  �    Instrument Handle                ��j���  �    Status                           Ϲ H  � �    Channel Name                    ���� K � �  �    Amplitude                              	           "1"    0    �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
         Specifies whether you want to enable or disable pulse width modulation for the channel.  The driver sets the TKAFG1K_ATTR_PWM_ENABLED attribute to this value. 

Valid Values:
VI_TRUE  - Enable PWM modulation  (Default)
VI_FALSE - Disable PWM modulation

   Ѱ   �  �    Instrument Handle                �p_���  �    Status                           �J @  � �    Channel Name                     �Q 8 � � �    Enabled                                	           "1"   True VI_TRUE False VI_FALSE    �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
    F    Passes the source of the modulating signal you want to use.  The driver sets the TKAFG1K_ATTR_FSK_SOURCE attribute to this value. 

Valid Values:
TKAFG1K_VAL_FSK_INTERNAL - internal modulation source
TKAFG1K_VAL_FSK_EXTERNAL - external modulation source

Default Value: 
TKAFG1K_VAL_FSK_INTERNAL - internal modulation source   �c#   �  �    Instrument Handle                �#x���  �    Status                           �� >  � �    Channel Name                     � = � � �    Source                                 	           "1"               DInternal TKAFG1K_VAL_FSK_INTERNAL External TKAFG1K_VAL_FSK_EXTERNAL    �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
     �    Passes the internal modulation rate of FSK modulation for the channel you specify. The driver sets the TKAFG1K_ATTR_FSK_INTERNAL_RATE attribute to this value.

Units:  Hz

Valid Range:  0.002 - 1000000  (Hz)

Default Value:  50  (Hz)   ��&   �  �    Instrument Handle                �Py���  �    Status                           * >  � �    Channel Name                     1 Ej �  �    Internal Rate                   ���� F � �  �    Deviation                              	           "1"    50    0    �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    Input the channel name for which you want to configure.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG1022            1,2
AFG1062            1,2

Default Value: "1"
   
O   �  �    Instrument Handle                j���  �    Status                           � G 
 � �    Channel Name                    ���� M � �  �    Deviation                              	           "1"    0   �    This function sets the value of a ViInt32 attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    L    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute.  Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box.  If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViInt32 type. 
  If you choose to see all IVI attributes, the data types appear
  to the right of the attribute names in the list box.  The data
  types that are not consistent with this function are dim.
  If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
    {    Pass the channel name for which you want to configure the operation mode.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG3021            1
AFG3022            1,2
AFG3101            1
AFG3102            1,2
AFG3251            1
AFG3252            1,2
AFG2021            1

Default Value: "1"    �   �  �    Instrument Handle                !k����  �    Status                           0G �  �  �    Attribute Value                  2j > � � �    Attribute ID                     7� >  �  �    Channel Name                           	                           0    "1"   �    This function sets the value of a ViReal64 attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors
        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    N    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute.  Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box.  If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViReal64 
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
    {    Pass the channel name for which you want to configure the operation mode.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG3021            1
AFG3022            1,2
AFG3101            1
AFG3102            1,2
AFG3251            1
AFG3252            1,2
AFG2021            1

Default Value: "1"   ?K   �  �    Instrument Handle                @����  �    Status                           N� �  �  �    Attribute Value                  Q > � � �    Attribute ID                     VW >  �  �    Channel Name                           	                           0    "1"   �    This function sets the value of a ViString attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    N    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute.  Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box.  If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViString 
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
    |    Pass the channel name for which you want to configure the operation mode.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG3021            1
AFG3022            1,2
AFG3101            1
AFG3102            1,2
AFG3251            1
AFG3252            1,2
AFG2021            1

Default Value: "1"
   ]�   �  �    Instrument Handle                ^�����  �    Status                           mx �  �  �    Attribute Value                  o� > � � �    Attribute ID                     t� >  �  �    Channel Name                           	                           0    "1"   �    This function sets the value of a ViBoolean attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors


        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    N    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute.  Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box.  If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViBoolean
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
    |    Pass the channel name for which you want to configure the operation mode.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG3021            1
AFG3022            1,2
AFG3101            1
AFG3102            1,2
AFG3251            1
AFG3252            1,2
AFG2021            1

Default Value: "1"
   |�   �  �    Instrument Handle                }8����  �    Status                           � �  �  �    Attribute Value                  �8 > � � �    Attribute ID                     �� >  �  �    Channel Name                           	                           0    "1"   �    This function sets the value of a ViSession attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    |    Pass the channel name for which you want to configure the operation mode.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG3021            1
AFG3022            1,2
AFG3101            1
AFG3102            1,2
AFG3251            1
AFG3252            1,2
AFG2021            1

Default Value: "1"
    N    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute.  Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box.  If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViSession
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   �   �  �    Instrument Handle                ������  �    Status                           �� �  �  �    Attribute Value                  �� >  �  �    Channel Name                     �X > � � �    Attribute ID                           	               "1"                0   �    This function queries the value of a ViInt32 attribute.

You can use this function to get the values of instrument-specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors


    �    Returns the current value of the attribute.  Pass the address of a ViInt32 variable.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>.  
    |    Pass the channel name for which you want to configure the operation mode.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG3021            1
AFG3022            1,2
AFG3101            1
AFG3102            1,2
AFG3251            1
AFG3252            1,2
AFG2021            1

Default Value: "1"
    �    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Help text is
  shown for each attribute.  Select an attribute by 
  double-clicking on it or by selecting it and then pressing
  <ENTER>.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViInt32 type. 
  If you choose to see all IVI attributes, the data types appear
  to the right of the attribute names in the list box.  The data
  types that are not consistent with this function are dim.
  If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   ��   �  �    Instrument Handle                �X����  �    Status                           �5 >j �  �    Attribute Value                  �� >  �  �    Channel Name                     �w �  � �    Attribute ID                           	           	            "1"                0   �    This function queries the value of a ViReal64 attribute.

You can use this function to get the values of instrument- specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors


    �    Returns the current value of the attribute.  Pass the address of a ViReal64 variable.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>.  
    |    Pass the channel name for which you want to configure the operation mode.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG3021            1
AFG3022            1,2
AFG3101            1
AFG3102            1,2
AFG3251            1
AFG3252            1,2
AFG2021            1

Default Value: "1"
    �    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Help text is
  shown for each attribute.  Select an attribute by 
  double-clicking on it or by selecting it and then pressing
  <ENTER>.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViReal64
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   �   �  �    Instrument Handle                ������  �    Status                           � >j �  �    Attribute Value                  �r >  �  �    Channel Name                     �� � 
 � �    Attribute ID                           	           	           "1"                0   +    This function queries the value of a ViString attribute.

You can use this function to get the values of instrument- specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

You must provide a ViChar array to serve as a buffer for the value.  You pass the number of bytes in the buffer as the Buffer Size parameter.  If the current value of the attribute, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size-1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the Buffer Size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you want to call this function just to get the required Buffer Size, you can pass 0 for the Buffer Size and VI_NULL for the Attribute Value buffer.  

If you want the function to fill in the buffer regardless of the number of bytes in the value, pass a negative number for the Buffer Size parameter.     �    The ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the return buffer, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors


    $    The buffer in which the function returns the current value of the attribute.  The buffer must be of type ViChar and have at least as many bytes as indicated in the Buffer Size parameter.

If the current value of the attribute, including the terminating NUL byte, contains more bytes that you indicate in this parameter, the function copies Buffer Size-1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the Buffer Size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you specify 0 for the Buffer Size parameter, you can pass VI_NULL for this parameter.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>.  
    |    Pass the channel name for which you want to configure the operation mode.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG3021            1
AFG3022            1,2
AFG3101            1
AFG3102            1,2
AFG3251            1
AFG3252            1,2
AFG2021            1

Default Value: "1"
    �    Pass the number of bytes in the ViChar array you specify for the Attribute Value parameter.  

If the current value of the attribute, including the terminating NUL byte, contains more bytes that you indicate in this parameter, the function copies Buffer Size-1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the Buffer Size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Attribute Value buffer parameter.

Default Value: 512    �    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Help text is
  shown for each attribute.  Select an attribute by 
  double-clicking on it or by selecting it and then pressing
  <ENTER>.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViString
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   �   �  �    Instrument Handle                ������  �    Status or Required Size           p p � � �    Attribute Value                  � >  �  �    Channel Name                       >� �  �    Buffer Size                      	 = � � �    Attribute ID                           	           	            "1"    512                0   �    This function queries the value of a ViBoolean attribute.

You can use this function to get the values of instrument- specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors


    �    Returns the current value of the attribute.  Pass the address of a ViBoolean variable.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>.  
    }    Pass the channel name for which you want to configure the operation mode.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG3021            1
AFG3022            1,2
AFG3101            1
AFG3102            1,2
AFG3251            1
AFG3252            1,2
AFG2021            1

Default Value: "1"

    �    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Help text is
  shown for each attribute.  Select an attribute by 
  double-clicking on it or by selecting it and then pressing
  <ENTER>.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViBoolean
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   �   �  �    Instrument Handle                �����  �    Status                            � >j �  �    Attribute Value                  "N >  �  �    Channel Name                     #� �  � �    Attribute ID                           	           	            "1"                0   �    This function queries the value of a ViSession attribute.

You can use this function to get the values of instrument- specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

    �    Returns the current value of the attribute.  Pass the address of a ViSession variable.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>.  
    {    Pass the channel name for which you want to configure the operation mode.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG3021            1
AFG3022            1,2
AFG3101            1
AFG3102            1,2
AFG3251            1
AFG3252            1,2
AFG2021            1

Default Value: "1"    �    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Help text is
  shown for each attribute.  Select an attribute by 
  double-clicking on it or by selecting it and then pressing
  <ENTER>.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViSession
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   +}   �  �    Instrument Handle                ,5����  �    Status                           ; >j �  �    Attribute Value                  <� >  �  �    Channel Name                     >T �  � �    Attribute ID                           	           	            "1"                0    S    This function checks the validity of a value you specify for a ViInt32 attribute.     �    The ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

    0    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    |    Pass the channel name for which you want to configure the operation mode.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG3021            1
AFG3022            1,2
AFG3101            1
AFG3102            1,2
AFG3251            1
AFG3252            1,2
AFG2021            1

Default Value: "1"
    K    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute.  Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box.  If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViInt32 type.
  If you choose to see all IVI attributes, the data types appear
  to the right of the attribute names in the list box.  The data
  types that are not consistent with this function are dim.
  If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   D�   �  �    Instrument Handle                ER����  �    Status                           T. �  �  �    Attribute Value                  Vf =  �  �    Channel Name                     W� >8 � �    Attribute ID                           	               "1"                0    T    This function checks the validity of a value you specify for a ViReal64 attribute.     �    The ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors


    0    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    |    Pass the channel name for which you want to configure the operation mode.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG3021            1
AFG3022            1,2
AFG3101            1
AFG3102            1,2
AFG3251            1
AFG3252            1,2
AFG2021            1

Default Value: "1"
    M    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute.  Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box.  If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViReal64
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   ^�   �  �    Instrument Handle                _�����  �    Status                           nd �  �  �    Attribute Value                  p� =  �  �    Channel Name                     r  >8 � �    Attribute ID                           	               "1"                0    T    This function checks the validity of a value you specify for a ViString attribute.     �    The ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors
    0    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    |    Pass the channel name for which you want to configure the operation mode.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG3021            1
AFG3022            1,2
AFG3101            1
AFG3102            1,2
AFG3251            1
AFG3252            1,2
AFG2021            1

Default Value: "1"
    M    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute.  Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box.  If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViString
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   y   �  �    Instrument Handle                y�����  �    Status                           �� �  �  �    Attribute Value                  �� >  �  �    Channel Name                     �V >8 � �    Attribute ID                           	               "1"                0    U    This function checks the validity of a value you specify for a ViBoolean attribute.     �    The ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

    0    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    |    Pass the channel name for which you want to configure the operation mode.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG3021            1
AFG3022            1,2
AFG3101            1
AFG3102            1,2
AFG3251            1
AFG3252            1,2
AFG2021            1

Default Value: "1"
    N    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute.  Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box.  If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViBoolean
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   �>   �  �    Instrument Handle                ������  �    Status                           �� �  �  �    Attribute Value                  �
 >  �  �    Channel Name                     �� >8 � �    Attribute ID                           	               "1"                0    U    This function checks the validity of a value you specify for a ViSession attribute.     �    The ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors
    0    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    |    Pass the channel name for which you want to configure the operation mode.

Valid values for different models are different.

Model              Valid Values
-----------------------------------------------
AFG3021            1
AFG3022            1,2
AFG3101            1
AFG3102            1,2
AFG3251            1
AFG3252            1,2
AFG2021            1

Default Value: "1"
    N    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute.  Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box.  If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViSession
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   �w   �  �    Instrument Handle                �/����  �    Status                           �
 �  �  �    Attribute Value                  �B >  �  �    Channel Name                     �� >8 � �    Attribute ID                           	               "1"                0    d    This function performs no operation and is present for compliance with the IviFgen specification.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

     �    The ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   Ǿ����  �    Status                           ֚   �  �    Instrument Handle                  	               d    This function performs no operation and is present for compliance with the IviFgen specification.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors


     �    The ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   �8����  �    Status                           �   �  �    Instrument Handle                  	               �    This function copies waveform data from one edit memory to the other one.

Notes:
The function is only supported by double-channel models: AFG3052C, AFG3102C, AFG3252C, AFG3022C.         �    This is the ViSession handles that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors    ,    Specifies the source memory from where waveform data is chosen. 

Valid Values:
TKAFG1K_VAL_OUTPUT_EMEM1 - Edit Memory 1
TKAFG1K_VAL_OUTPUT_EMEM2 - Edit Memory 2

Default Value:
TKAFG1K_VAL_OUTPUT_EMEM1 - Edit Memory 1

SCPI Command:
TRACe|DATA:EMEMCOPY {EMEMory[1]|EMEMory2},{EMEMory[1]|EMEMory2}
    +    Specifies the target memory to store the copied waveform data. 

Valid Values:
TKAFG1K_VAL_OUTPUT_EMEM1 - Edit Memory 1
TKAFG1K_VAL_OUTPUT_EMEM2 - Edit Memory 2

Default Value:
TKAFG1K_VAL_OUTPUT_EMEM2 - Edit Memory 2

SCPI Command:
TRACe|DATA:EMEMCOPY {EMEMory[1]|EMEMory2},{EMEMory[1]|EMEMory2}
   � %  �  �    Instrument Handle                ������  �    Status                           �� > % � �    Source Edit Memory               �� >� � �    Target Edit Memory                     	                      NEdit Memory 1 TKAFG1K_VAL_OUTPUT_EMEM1 Edit Memory 2 TKAFG1K_VAL_OUTPUT_EMEM2              NEdit Memory 1 TKAFG1K_VAL_OUTPUT_EMEM1 Edit Memory 2 TKAFG1K_VAL_OUTPUT_EMEM2    �    This function sets or gets waveform point value.

Notes:
This function is only supported by AFG3011C, AFG3021C, AFG3051C, AFG3052C, AFG3101C, AFG3102C, AFG3251C, AFG3252C, AFG3022C.    
     �    This is the ViSession handles that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     [    Specifies the point index in the edit memory.

Valid Range:
1 to 131072

Default Value:
1     �    Specifies the data value at the point index.

Valid Range:

Default Value:
100

Note:
When the value of "Operation Select" is "Get Point Value", point value is invalid.     �    Selects the waveform points opertaions.

Valid Values:
TKAFG1K_VAL_WFM_SETPOINT - Set Point Value
TKAFG1K_VAL_WFM_GETPOINT - Get Point Value

Default Value:
TKAFG1K_VAL_WFM_SETPOINT - Set Point Value
     2    Returns the data value at specified point index.    Q    Specifies the edit memory to set or get waveform point value.

Valid Values:
TKAFG1K_VAL_OUTPUT_EMEM:  Edit Memory
TKAFG1K_VAL_OUTPUT_EMEM1: Edit Memory 1
TKAFG1K_VAL_OUTPUT_EMEM2: Edit Memory 2

Default Value:
TKAFG1K_VAL_OUTPUT_EMEM

Notes:
(1) Only Edit Memory is available for AFG 3K, AFG 3KB and AFG 3KC( firmware version is less than 1.0.4 ).
(2) Edit Memory 2 is supported since AFG 3KC firmware version 1.0.4 and only available on dual-channel models.
(3) In Set Point Value Operation, Edit Memory stands for both Edit Memory 1 and Edit Memory 2 since AFG 3KC firmware version 1.0.4. 
(4) In Get Point Value Operation, Edit Memory is the same as Edit Memory 1 since AFG 3KC firmware version 1.0.4.

SCPI Command:
TRACe|DATA[:DATA]:VALue { EMEMory| EMEMory1 |EMEMory2},<point>,<data>

TRACe|DATA[:DATA]:VALue? {EMEMory[1]|EMEMory2},<points>   �k %  �  �    Instrument Handle                �,����  �    Status                            > % �  �    Point Index                      i >� �  �    Point Value                       � % � �    Operation Select                 � �� �  �    Query Value                      ' � % � �    Edit Memory                            	           1    100               RSet Point Value TKAFG1K_VAL_WFM_SETPOINT Get Point Value TKAFG1K_VAL_WFM_GETPOINT    
        0               rEdit Memory TKAFG1K_VAL_OUTPUT_EMEM Edit Memory 1 TKAFG1K_VAL_OUTPUT_EMEM1 Edit Memory 2 TKAFG1K_VAL_OUTPUT_EMEM2   &    This function resets the instrument to a known state and sends initialization commands to the instrument.  The initialization commands set instrument settings such as Headers Off, Short Command form, and Data Transfer Binary to the state necessary for the operation of the instrument driver.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

     �    The ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   ,����  �    Status                           %   �  �    Instrument Handle                  	               �    This function resets the instrument and applies initial user specified settings from the Logical Name which was used to initialize the session.  If the session is created without a Logical Name, this function is equivalent to the tkafg1k_reset function.    �    Reports the status of this operation.

To obtain a text description of the status code, or if the status code is not listed below, call the tkafg1k_error_message function.  To obtain additional information about the error condition, use the tkafg1k_GetError and tkafg1k_ClearError functions.

Status Codes:

Status    Description
-------------------------------------------------
       0  No error (the call is successful).

3FFF0005  The specified termination character is read.
3FFF0006  The specified number of bytes is read.

3FFC0102  Reset not supported.

BFFF0000  Miscellaneous or system error occurred.
BFFF000E  Invalid session handle.
BFFF0015  Timeout occurred before operation completes.
BFFF0034  Violation of raw write protocol occurred.
BFFF0035  Violation of raw read protocol occurred.
BFFF0036  Device reports an output protocol error.
BFFF0037  Device reports an input protocol error.
BFFF0038  Bus error occurred during transfer.
BFFF003A  Invalid setup (attributes are not consistent).
BFFF005F  A "no listeners" condition is detected.
BFFF0060  This interface is not the controller-in-charge.
BFFF0067  Operation is not supported on this session.     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   'A����  �    Status                           +�   �  �    Instrument Handle                  	               �    This function places the instrument in a quiescent state where it has minimal or no impact on the system to which it is connected.    �    Reports the status of this operation.

To obtain a text description of the status code, or if the status code is not listed below, call the tkafg1k_error_message function.  To obtain additional information about the error condition, use the tkafg1k_GetError and tkafg1k_ClearError functions.

Status Codes:

Status    Description
-------------------------------------------------
       0  No error (the call is successful).

3FFF0005  The specified termination character is read.
3FFF0006  The specified number of bytes is read.

3FFC0102  Reset not supported.

BFFF0000  Miscellaneous or system error occurred.
BFFF000E  Invalid session handle.
BFFF0015  Timeout occurred before operation completes.
BFFF0034  Violation of raw write protocol occurred.
BFFF0035  Violation of raw read protocol occurred.
BFFF0036  Device reports an output protocol error.
BFFF0037  Device reports an input protocol error.
BFFF0038  Bus error occurred during transfer.
BFFF003A  Invalid setup (attributes are not consistent).
BFFF005F  A "no listeners" condition is detected.
BFFF0060  This interface is not the controller-in-charge.
BFFF0067  Operation is not supported on this session.
     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   -�����  �    Status                           2@   �  �    Instrument Handle                  	               `    This function returns the revision numbers of the instrument driver and instrument firmware.

     �    Returns the instrument driver software revision numbers in the form of a string.

You must pass a ViChar array with at least 256 bytes.     �    Returns the instrument firmware revision numbers in the form of a string.

You must pass a ViChar array with at least 256 bytes.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

     �    The ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   3� >  �  �    Instrument Driver Revision       4s >Q �  �    Firmware Revision                4�����  �    Status                           C�   �  �    Instrument Handle                  	            	            	               V    This function reads an error code and a message from the instrument's error queue.

     B    Returns the error code read from the instrument's error queue.

     �    Returns the error message string read from the instrument's error message queue.

You must pass a ViChar array with at least 256 bytes.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors



     �    The ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   E� >  �  �    Error Code                       F6 > � � ,    Error Message                    F�����  �    Status                           U�   �  �    Instrument Handle                  	           	            	               n    This function converts a status code returned by an instrument driver function into a user-readable string.     )�    Pass the Status parameter that is returned from any of the instrument driver functions.
          
Default Value:  0  (VI_SUCCESS)
          
tkafg1k Status Codes:
Status    Description
-------------------------------------------------
TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL (0xBFFA4011)
          The instrument model is not in the list of supporting 
          models of the instrument driver. 

TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED (0xBFFA4021)
          It means that signal generation abortion is not 
          supported when user try to call function 
          tkafg1k_AbortGeneration to abort a previously 
          initiated signal generation. 

TKAFG1K_ERROR_CHANNELS_DIFFERENT (0xBFFA4031)
          Attribute setting of the two Channels is different 
          when user try to get the value of attributes which are 
          channel irrelevant.         
           
TKAFG1K_ERROR_COMBINATION_UNSUPPORTED (0xBFFA4032)
          Run mode user selects is not fit for current waveform.          

TKAFG1K_ERROR_INVALID_GROUP_VALUE (0xBFFA4033)
          Try to set a group of value which is invalid.

TKAFG1K_ERROR_INIT_FAIL (0xBFFA4034)
          Instrument driver initialization fails.

IviFgen Status Codes:
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not set to software.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.

IVI Engine Status Codes:
Status    Description
-------------------------------------------------
ERRORS:
BFFA0001  Instrument error. Call tkafg1k_error_query.
BFFA0002  Cannot open file.
BFFA0003  Error reading from file.
BFFA0004  Error writing to file.
BFFA0005  Driver module file not found.
BFFA0006  Cannot open driver module file for reading.
BFFA0007  Driver module has invalid file format or invalid data.
BFFA0008  Driver module contains undefined references.
BFFA0009  Cannot find function in driver module.
BFFA000A  Failure loading driver module.
BFFA000B  Invalid path name.
BFFA000C  Invalid attribute.
BFFA000D  IVI attribute is not writable.
BFFA000E  IVI attribute is not readable.
BFFA000F  Invalid parameter.
BFFA0010  Invalid value.
BFFA0011  Function not supported.
BFFA0012  Attribute not supported.
BFFA0013  Value not supported.
BFFA0014  Invalid type.
BFFA0015  Types do not match.
BFFA0016  Attribute already has a value waiting to be updated.
BFFA0017  Specified item already exists.
BFFA0018  Not a valid configuration.
BFFA0019  Requested item does not exist or value not available.
BFFA001A  Requested attribute value not known.
BFFA001B  No range table.
BFFA001C  Range table is invalid.
BFFA001D  Object or item is not initialized.
BFFA001E  Non-interchangeable behavior.
BFFA001F  No channel table has been built for the session.
BFFA0020  Channel name specified is not valid.
BFFA0021  Unable to allocate system resource.
BFFA0022  Permission to access file was denied.
BFFA0023  Too many files are already open.
BFFA0024  Unable to create temporary file in target directory.
BFFA0025  All temporary filenames already used.
BFFA0026  Disk is full.
BFFA0027  Cannot find configuration file on disk.
BFFA0028  Cannot open configuration file.
BFFA0029  Error reading configuration file.
BFFA002A  Invalid ViInt32 value in configuration file.
BFFA002B  Invalid ViReal64 value in configuration file.
BFFA002C  Invalid ViBoolean value in configuration file.
BFFA002D  Entry missing from configuration file.
BFFA002E  Initialization failed in driver DLL.
BFFA002F  Driver module has unresolved external reference.
BFFA0030  Cannot find CVI Run-Time Engine.
BFFA0031  Cannot open CVI Run-Time Engine.
BFFA0032  CVI Run-Time Engine has invalid format.
BFFA0033  CVI Run-Time Engine is missing required function(s).
BFFA0034  CVI Run-Time Engine initialization failed.
BFFA0035  CVI Run-Time Engine has unresolved external reference.
BFFA0036  Failure loading CVI Run-Time Engine.
BFFA0037  Cannot open DLL for read exports.
BFFA0038  DLL file is corrupt.
BFFA0039  No DLL export table in DLL.
BFFA003A  Unknown attribute name in default configuration file.
BFFA003B  Unknown attribute value in default configuration file.
BFFA003C  Memory pointer specified is not known.
BFFA003D  Unable to find any channel strings.
BFFA003E  Duplicate channel string.
BFFA003F  Duplicate virtual channel name.
BFFA0040  Missing virtual channel name.
BFFA0041  Bad virtual channel name.
BFFA0042  Unassigned virtual channel name.
BFFA0043  Bad virtual channel assignment.
BFFA0044  Channel name required.
BFFA0045  Channel name not allowed.
BFFA0046  Attribute not valid for channel.
BFFA0047  Attribute must be channel based.
BFFA0048  Channel already excluded.
BFFA0049  Missing option name (nothing before the '=').
BFFA004A  Missing option value (nothing after the '=').
BFFA004B  Bad option name.
BFFA004C  Bad option value.
BFFA004D  Operation only valid on a class driver session.
BFFA004E  "ivi.ini" filename is reserved.
BFFA004F  Duplicate run-time configuration entry.
BFFA0050  Index parameter is one-based.
BFFA0051  Index parameter is too high.
BFFA0052  Attribute is not cacheable.
BFFA0053  You cannot export a ViAddr attribute to the end-user.
BFFA0054  Bad channel string in channel string list.
BFFA0055  Bad prefix name in default configuration file.
         
VISA Status Codes:
Status    Description
-------------------------------------------------
WARNINGS:
3FFF0002 Event enabled for one or more specified mechanisms.
3FFF0003 Event disabled for one or more specified mechanisms.
3FFF0004 Successful, but queue already empty.
3FFF0005 Specified termination character was read.
3FFF0006 Number of bytes transferred equals input count.
3FFF0077 Configuration non-existant or could not be loaded.
3FFF007D Open successful, but the device not responding.
3FFF0080 Wait successful, but more event objects available.
3FFF0082 Specified object reference is uninitialized.
3FFF0084 Attribute value not supported.
3FFF0085 Status code could not be interpreted.
3FFF0088 Specified I/O buffer type not supported.
3FFF0098 Successful,  but invoke no handlers for this event.
3FFF0099 Successful but session has nested shared locks.
3FFF009A Successful but session has nested exclusive locks.
3FFF009B Successful but operation not asynchronous.
         
ERRORS:
BFFF0000 Unknown system error (miscellaneous error).
BFFF000E Session or object reference is invalid.
BFFF000F Resource is locked.
BFFF0010 Invalid expression specified for search.
BFFF0011 Resource is not present in the system.
BFFF0012 Invalid resource reference specified.  Parsing error.
BFFF0013 Invalid access mode.
BFFF0015 Timeout expired before operation completed.
BFFF0016 Unable to deallocate session data structures.
BFFF001B Specified degree is invalid.
BFFF001C Specified job identifier is invalid.
BFFF001D Attribute is not supported by the referenced object.
BFFF001E Attribute state not supported by the referenced object.
BFFF001F Specified attribute is read-only.
BFFF0020 Lock type lock not supported by this resource.
BFFF0021 Invalid access key.
BFFF0026 Specified event type not supported by the resource.
BFFF0027 Invalid mechanism specified.
BFFF0028 A handler was not installed.
BFFF0029 Handler reference either invalid or was not installed.
BFFF002A Specified event context invalid.
BFFF002D Event queue for specified type has overflowed.
BFFF002F Event type must be enabled in order to receive.
BFFF0030 User abort during transfer.
BFFF0034 Violation of raw write protocol during transfer.
BFFF0035 Violation of raw read protocol during transfer.
BFFF0036 Device reported output protocol error during transfer.
BFFF0037 Device reported input protocol error during transfer.
BFFF0038 Bus error during transfer.
BFFF0039 Unable to queue asynchronous operation.
BFFF003A Unable to start operation because setup is invalid.
BFFF003B Unable to queue the asynchronous operation.
BFFF003C Insufficient resources to perform memory allocation.
BFFF003D Invalid buffer mask specified.
BFFF003E I/O error.
BFFF003F Format specifier invalid.
BFFF0041 Format specifier not supported.
BFFF0042 Trigger line is currently in use.
BFFF004A Service request not received for the session.
BFFF004E Invalid address space specified.
BFFF0051 Invalid offset specified.
BFFF0052 Invalid access width specified.
BFFF0054 Offset not accessible from this hardware.
BFFF0055 Source and destination widths are different.
BFFF0057 Session not currently mapped.
BFFF0059 Previous response still pending.
BFFF005F No listeners condition detected.
BFFF0060 Interface not currently the controller in charge.
BFFF0061 Interface not the system controller.
BFFF0067 Session does not support this operation.
BFFF006A A parity error occurred during transfer.
BFFF006B A framing error occurred during transfer.
BFFF006C An overrun error occurred during transfer.
BFFF0070 Offset not properly aligned for operation access width.
BFFF0071 Specified user buffer not valid.
BFFF0072 Resource valid, but VISA cannot access it.
BFFF0076 Width not supported by this hardware.
BFFF0078 Invalid parameter value, parameter unknown.
BFFF0079 Invalid protocol.
BFFF007B Invalid window size.
BFFF0080 Session currently contains a mapped window.
BFFF0081 Operation not implemented.
BFFF0083 Invalid length.
BFFF0091 Invalid mode.
BFFF009C Session did not have a lock on the resource.
BFFF009D The device does not export any memory.
BFFF009E VISA-required code library not located or not loaded.
         
VXIPnP Driver Status Codes:
Status    Description
-------------------------------------------------
WARNINGS:
3FFC0101  Instrument does not have ID Query capability.
3FFC0102  Instrument does not have Reset capability.
3FFC0103  Instrument does not have Self-Test capability.
3FFC0104  Instrument does not have Error Query capability.
3FFC0105  Instrument does not have Revision Query capability.
          
ERRORS:
BFFC0001  Parameter 1 out of range, or error trying to set it.
BFFC0002  Parameter 2 out of range, or error trying to set it.
BFFC0003  Parameter 3 out of range, or error trying to set it.
BFFC0004  Parameter 4 out of range, or error trying to set it.
BFFC0005  Parameter 5 out of range, or error trying to set it.
BFFC0006  Parameter 6 out of range, or error trying to set it.
BFFC0007  Parameter 7 out of range, or error trying to set it.
BFFC0008  Parameter 8 out of range, or error trying to set it.
BFFC0011  Instrument failed the ID Query.
BFFC0012  Invalid response from instrument.

     �    Returns the user-readable message string that corresponds to the status code you specify.

You must pass a ViChar array with at least 256 bytes.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors



        The ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

You can pass VI_NULL for this parameter.  This is useful when one of the initialize functions fail.

Default Value:  VI_NULL
   W� >  �  h    Error Code                       �k = � � �    Error Message                    �����  �    Status                           ��   �  �    Instrument Handle                  0    	            	           VI_NULL    P    This function invalidates the cached values of all attributes for the session.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

     �    The ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   �X����  �    Status                           �4   �  �    Instrument Handle                  	              b    This function returns the highest-level channel name that corresponds to the specific driver channel string that is in the channel table at an index you specify.  By passing 0 for the buffer size, the caller can ascertain the buffer size required to get the entire channel name string and then call the function again with a sufficiently large buffer.
     �    The ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors


     <    A 1-based index into the channel table.

Default Value:  1        Returns the highest-level channel name that corresponds to the specific driver channel string that is in the channel table at an index you specify..

The buffer must contain at least as many elements as the value you specify with the Buffer Size parameter.  If the channel name description, including the terminating NUL byte, contains more bytes than you indicate with the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass 0 for the Buffer Size, you can pass VI_NULL for this parameter.    �    Pass the number of bytes in the ViChar array you specify for the Channel Name parameter.

If the channel name, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies BufferSize - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Channel Name buffer parameter.

Default Value:  512   ��   �  �    Instrument Handle                ������  �    Status                           �d >  �  �    Index                            �� >Q �  �    Channel Name                     �� �  �  �    Buffer Size                            	           1    	            512   �    This function retrieves and then clears the IVI error information for the session or the current execution thread. One exception exists: If the BufferSize parameter is 0, the function does not clear the error information. By passing 0 for the buffer size, the caller can ascertain the buffer size required to get the entire error description string and then call the function again with a sufficiently large buffer.

If you specify a valid IVI session for the InstrumentHandle parameter, Get Error retrieves and then clears the error information for the session.  If you pass VI_NULL for the InstrumentHandle parameter, this function retrieves and then clears the error information for the current execution thread.  If the InstrumentHandle parameter is an invalid session, the function does nothing and returns an error. Normally, the error information describes the first error that occurs since you last call tkafg1k_GetError or tkafg1k_ClearError.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the return buffer, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors


     �    This is the ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Passes the number of bytes in the ViChar array you specify for the Description parameter.

If the error description, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies BufferSize - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Description buffer parameter.

Default Value:  512     �    Returns the error code for the session or execution thread.

If you pass 0 for the Buffer Size, you can pass VI_NULL for this parameter.
    �    Returns the error description for the IVI session or execution thread.  If there is no description, the function returns an empty string.

The buffer must contain at least as many elements as the value you specify with the Buffer Size parameter.  If the error description, including the terminating NUL byte, contains more bytes than you indicate with the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass 0 for the Buffer Size, you can pass VI_NULL for this parameter.   ������  �    Status or Required Size          �*   �  �    Instrument Handle                �� >  �  �    BufferSize                       �� >{ �  �    Code                             �^ � � � �    Description                        	               512    	           	           a    This function clears the error code and error description for the IVI session. If the user specifies a valid IVI session for the InstrumentHandle parameter, this function clears the error information for the session. If the user passes VI_NULL for the Vi parameter, this function clears the error information for the current execution thread. If the Vi parameter is an invalid session, the function does nothing and returns an error.
The function clears the error code by setting it to VI_SUCCESS.  If the error description string is non-NULL, the function de-allocates the error description string and sets the address to VI_NULL.

Maintaining the error information separately for each thread is useful if the user does not have a session handle to pass to the tkafg1k_GetError function, which occurs when a call to tkafg1k_init or tkafg1k_InitWithOptions fails.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    The ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   ������  �    Status                           ��   �  �    Instrument Handle                  	              �    This function returns the coercion information associated with the IVI session.  This function retrieves and clears the oldest instance in which the instrument driver coerced a value you specify to another value.

If you set the TKAFG1K_ATTR_RECORD_COERCIONS attribute to VI_TRUE, the instrument driver keeps a list of all coercions it makes on ViInt32 or ViReal64 values you pass to instrument driver functions.  You use this function to retrieve information from that list.

If the next coercion record string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Coercion Record buffer parameter.

The function returns an empty string in the Coercion Record parameter if no coercion records remain for the session.

    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the return buffer, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

     �    This is the ViSession handle that you obtain from the tkafg1k_init function.  The handle identifies a particular instrument session.

Default Value:  None    	    Returns the next coercion record for the IVI session.  If there are no coercion records, the function returns an empty string.

The buffer must contain at least the same number of elements as the value you specify with the Buffer Size parameter.  If the next coercion record string, including the terminating NUL byte, contains more bytes than you indicate with the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

This parameter returns an empty string if no coercion records remain for the session.
    �    Passes the number of bytes in the ViChar array you specify for the Coercion Record parameter.

If the next coercion record string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Coercion Record buffer parameter.

Default Value:  512

   ������  �    Status or Required Size          �   �  �    Instrument Handle                $ �  � �    Coercion Record                  5 >  �  �    Buffer Size                        	               	            512   .    This function returns the interchangeability warnings associated with the IVI session. It retrieves and clears the oldest instance in which the class driver recorded an interchangeability warning.  Interchangeability warnings indicate that using your application with a different instrument might cause different behavior. You use this function to retrieve interchangeability warnings.

The driver performs interchangeability checking when the TKAFG1K_ATTR_INTERCHANGE_CHECK attribute is set to VI_TRUE.

The function returns an empty string in the Interchange Warning parameter if no interchangeability warnings remain for the session.

In general, the instrument driver generates interchangeability warnings when an attribute that affects the behavior of the instrument is in a state that you did not specify.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the return buffer, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

     �    The ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Pass the number of bytes in the ViChar array you specify for the Interchange Warning parameter.

If the next interchangeability warning string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value. For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Interchange Warning buffer parameter.

Default Value:  512
        Returns the next interchange warning for the IVI session. If there are no interchange warnings, the function returns an empty  string.

The buffer must contain at least as many elements as the value you specify with the Buffer Size parameter. If the next interchangeability warning string, including the terminating NUL byte, contains more bytes than you indicate with the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

This parameter returns an empty string if no interchangeability
warnings remain for the session.

   X����  �    Status or Required Size          �   �  �    Instrument Handle                � >  �  �    Buffer Size                       � �  � �    Interchange Warning                	               512    	            A    This function clears the list of current interchange warnings.
     �    The ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

   %   �  �    Instrument Handle                %�����  �    Status                                 	          �    When developing a complex test system that consists of multiple test modules, it is generally a good idea to design the test modules so that they can run in any order.  To do so requires ensuring that each test module completely configures the state of each instrument it uses.  If a particular test module does not completely configure the state of an instrument, the state of the instrument depends on the configuration from a previously executed test module.  If you execute the test modules in a different order, the behavior of the instrument and therefore the entire test module is likely to change.  This change in behavior is generally instrument specific and represents an interchangeability problem.

You can use this function to test for such cases.  After you call this function, the interchangeability checking algorithms in the specific driver ignore all previous configuration operations.  By calling this function at the beginning of a test module, you can determine whether the test module has dependencies on the operation of previously executed test modules.

This function does not clear the interchangeability warnings from the list of previously recorded interchangeability warnings.  If you want to guarantee that the tkafg1k_GetNextInterchangeWarning function only returns those interchangeability warnings that are generated after calling this function, you must clear the list of interchangeability warnings.  You can clear the interchangeability warnings list by repeatedly calling the tkafg1k_GetNextInterchangeWarning function until no more interchangeability warnings are returned.  If you are not interested in the content of those warnings, you can call the tkafg1k_ClearInterchangeWarnings function.
     �    The ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors   ;�   �  �    Instrument Handle                <�����  �    Status                                 	          .    This function obtains a multithread lock on the instrument session.  Before it does so, it waits until all other execution threads have released their locks on the instrument session.

Other threads might have obtained a lock on this session in the following ways:

- The user's application called tkafg1k_LockSession.

- A call to the instrument driver locked the session.

- A call to the IVI engine locked the session.

After your call to tkafg1k_LockSession returns successfully, no other threads can access the instrument session until you call tkafg1k_UnlockSession.

Use tkafg1k_LockSession and tkafg1k_UnlockSession around a sequence of calls to instrument driver functions if you require that the instrument retain its settings through the end of the sequence.

You can safely make nested calls to tkafg1k_LockSession within the same thread.  To completely unlock the session, you must balance each call to tkafg1k_LockSession with a call to tkafg1k_UnlockSession.  If, however, you use the Caller Has Lock parameter in all calls to tkafg1k_LockSession and tkafg1k_UnlockSession within a function, the IVI Library locks the session only once within the function regardless of the number of calls you make to tkafg1k_LockSession.  This allows you to call tkafg1k_UnlockSession just once at the end of the function. 
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    The ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    This parameter serves as a convenience.  If you do not want to use this parameter, pass VI_NULL. 

Use this parameter in complex functions to keep track of whether you obtain a lock and therefore need to unlock the session.  Pass the address of a local ViBoolean variable.  In the declaration of the local variable, initialize it to VI_FALSE.  Pass the address of the same local variable to any other calls you make to tkafg1k_LockSession or tkafg1k_UnlockSession in the same function.

The parameter is an input/output parameter.  tkafg1k_LockSession and tkafg1k_UnlockSession each inspect the current value and take the following actions:

- If the value is VI_TRUE, tkafg1k_LockSession does not lock the session again.  If the value is VI_FALSE, tkafg1k_LockSession obtains the lock and sets the value of the parameter to VI_TRUE.

- If the value is VI_FALSE, tkafg1k_UnlockSession does not attempt to unlock the session.  If the value is VI_TRUE, tkafg1k_UnlockSession releases the lock and sets the value of the parameter to VI_FALSE.
 
Thus, you can, call tkafg1k_UnlockSession at the end of your function without worrying about whether you actually have the lock.  

Example:

ViStatus TestFunc (ViSession vi, ViInt32 flags)
{
    ViStatus error = VI_SUCCESS;
    ViBoolean haveLock = VI_FALSE;

    if (flags & BIT_1)
        {
        viCheckErr( tkafg1k_LockSession(vi, &haveLock));
        viCheckErr( TakeAction1(vi));
        if (flags & BIT_2)
            {
            viCheckErr( tkafg1k_UnlockSession(vi, &haveLock));
            viCheckErr( TakeAction2(vi));
            viCheckErr( tkafg1k_LockSession(vi, &haveLock);
            } 
        if (flags & BIT_3)
            viCheckErr( TakeAction3(vi));
        }

Error:
    /* 
       At this point, you cannot really be sure that 
       you have the lock.  Fortunately, the haveLock 
       variable takes care of that for you.          
    */
    tkafg1k_UnlockSession(vi, &haveLock);
    return error;
}   Q<����  �    Status                           `   �  �    Instrument Handle                `� >  �  �    Caller Has Lock                    	               	            �    This function releases a lock that you acquired on an instrument session using tkafg1k_LockSession.  Refer to tkafg1k_LockSession for additional information on session locks.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    The ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    This parameter serves as a convenience.  If you do not want to use this parameter, pass VI_NULL. 

Use this parameter in complex functions to keep track of whether you obtain a lock and therefore need to unlock the session. 
Pass the address of a local ViBoolean variable.  In the declaration of the local variable, initialize it to VI_FALSE.  Pass the address of the same local variable to any other calls you make to tkafg1k_LockSession or tkafg1k_UnlockSession in the same function.

The parameter is an input/output parameter.  tkafg1k_LockSession and tkafg1k_UnlockSession each inspect the current value and take the following actions:

- If the value is VI_TRUE, tkafg1k_LockSession does not lock the session again.  If the value is VI_FALSE, tkafg1k_LockSession obtains the lock and sets the value of the parameter to VI_TRUE.

- If the value is VI_FALSE, tkafg1k_UnlockSession does not attempt to unlock the session.  If the value is VI_TRUE, tkafg1k_UnlockSession releases the lock and sets the value of the parameter to VI_FALSE.
 
Thus, you can call tkafg1k_UnlockSession at the end of your function without worrying about whether you actually have the lock.  

Example:

ViStatus TestFunc (ViSession vi, ViInt32 flags)
{
    ViStatus error = VI_SUCCESS;
    ViBoolean haveLock = VI_FALSE;

    if (flags & BIT_1)
        {
        viCheckErr( tkafg1k_LockSession(vi, &haveLock));
        viCheckErr( TakeAction1(vi));
        if (flags & BIT_2)
            {
            viCheckErr( tkafg1k_UnlockSession(vi, &haveLock));
            viCheckErr( TakeAction2(vi));
            viCheckErr( tkafg1k_LockSession(vi, &haveLock);
            } 
        if (flags & BIT_3)
            viCheckErr( TakeAction3(vi));
        }

Error:
    /* 
       At this point, you cannot really be sure that 
       you have the lock.  Fortunately, the haveLock 
       variable takes care of that for you.          
    */
    tkafg1k_UnlockSession(vi, &haveLock);
    return error;
}   j����  �    Status                           x�   �  �    Instrument Handle                y� >  �  �    Caller Has Lock                    	               	           �    This function writes a command string directly to an instrument using VISA I/O. The function bypasses the attribute state caching mechanism and therefore always invalidates all attribute cache values for the session.

The function assumes that the IVI_ATTR_SYSTEM_IO_SESSION attribute for the IVI session you specify holds a valid VISA session for the instrument.

The function calls Ivi_SetNeedToCheckStatus with VI_TRUE.

Note: This function is supported with the IVI Compliance Package (ICP) 4.6.1 and later. If you are using an earlier version of ICP, you can still use the WriteInstrData and ReadInstrData functions under the Obsolete folder.
     9    Specify the string you want to send to the instrument.
     0    Returns the number of bytes actually written.
     �    Specifies the number of bytes to write to the instrument. The value of this parameter must be less than or equal to the size of buffer.
     �    The ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors   �� -  �  �    Write Buffer                     �� -� �  �    Number of Bytes Written          � - � �  �    Number of Bytes to Write         ��   �  �    Instrument Handle                �h����  �    Status                             ""    	                    	               This function reads data directly from an instrument using VISA I/O. The function bypasses the attribute state caching mechanism.

The function assumes that the IVI_ATTR_SYSTEM_IO_SESSION attribute for the IVI session you specify holds a valid VISA session for the instrument.

If data is not available at the instrument's output buffer when you call this function, the instrument might hang up. In that case, the function does not return until the VISA I/O call times out. If you have disabled the timeout, the function hangs indefinitely.

Note: This function is supported with the IVI Compliance Package (ICP) 4.6.1 and later. If you are using an earlier version of ICP, you can still use the WriteInstrData and ReadInstrData functions under the Obsolete folder.
    �    Specify the maximum number of bytes to read from the instrument. The Read Buffer parameter must be a ViChar buffer that contains at least the number of bytes you specify.

If the number of bytes you specify is less than the number of bytes in the instrument's output buffer, you must call this function again to empty the output buffer. If you do not empty the instrument's output buffer, the instrument might return invalid data in response to subsequent requests.

If data is not available at the instrument's output buffer when you call this function, the instrument might hang up. In that case, the function does not return until the VISA I/O call times out. If you have disabled the timeout, the function hangs indefinitely.
    j    A buffer in which the function places the data it receives from the instrument.

The buffer must be a ViChar array that has at least as many bytes as you specify in the Number Bytes To Read parameter.

This function does not write an ASCII NUL byte to terminate the data, nor does it clear the buffer beyond the bytes it actually receives from the instrument.
    �    This control returns the actual number of bytes the function received from the instrument. This is the value that the VISA viRead function returns.

If the actual number of bytes received is less than the number of bytes you specify in the Number Bytes To Read parameter, the instrument's output buffer has probably emptied.

If the number of bytes received is 0, the most probable cause is that no data was available at the instrument's output buffer.
     �    The ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors   �0 -  �  �    Number of Bytes to Read          � - � �  �    Read Buffer                      �� -� �  �    Number of Bytes Read             �U   �  �    Instrument Handle                �����  �    Status                                 	            	                	          �    This function performs the following operations:

- Closes the instrument I/O session.

- Destroys the instrument driver session and all of its attributes.

- Deallocates any memory resources the driver uses.

Notes:
(1) You must unlock the session when you call tkafg1k_close.

(2) After calling tkafg1k_close, you cannot use the instrument driver again until you call tkafg1k_init or tkafg1k_InitWithOptions.

    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    The ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   �x����  �    Status                           �R   �  �    Instrument Handle                  	               �    This function writes a user-specified string to the instrument.

Notes:  
This function bypasses IVI attribute state caching.  Therefore, when you call this function, the cached values for all attributes will be invalidated.     2    Pass the string to be written to the instrument.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    The ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   �n >  �  �    Write Buffer                     ������  �    Status                           ��   �  �    Instrument Handle                      	               /    This function reads data from the instrument.     c    After this function executes, this parameter contains the data that was read from the instrument.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the tkafg1k_error_message function.  To obtain additional information about the error condition, call the tkafg1k_GetError function.  To clear the error information from the driver, call the tkafg1k_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
ERRORS:
------------------------------------------------- 

Status:         TKAFG1K_ERROR_NO_WFMS_AVAILABLE             
Description:    No arbitrary waveform structure is free when  
                you create a new arbitrary waveform.             

Status:         TKAFG1K_ERROR_INVALID_SPECIFIC_MODEL            
Description:    The instrument model is not in the list of 
                supporting models of the instrument driver. 
                You can specify it or obtain it from  
                instrument by IDQUERY command.
                Currently the instrument driver supports the 
                following models:
                              AFG3021
                              AFG3022
                              AFG3101
                              AFG3202
                              AFG3251
                              AFG3252
                
Status:         TKAFG1K_ERROR_ABORT_GENERATION_UNSUPPORTED      
Description:    It means that signal generation abortion is
                not supported when you call function 
                tkafg1k_AbortGeneration to abort a previously 
                initiated signal generation.
 
Status:         TKAFG1K_ERROR_CHANNELS_DIFFERENT                
Description:    Attribute settings of the two Channels are 
                different when you try to get the value of 
                attributes which are channel irrelevant.
                
Status:         TKAFG1K_ERROR_COMBINATION_UNSUPPORTED           
Description:    Run mode you select does not fit for current 
                waveform.

Status:         TKAFG1K_ERROR_INVALID_GROUP_VALUE
Description:    Try to set a group of value which is 
                invalid. The error often appears when you 
                set a group of attributes through  
                configuration functions. The attributes are 
                internally related, and it is quite 
                possible that value you specify for any 
                single attribute is valid while the combination 
                is not allowable.                          

Status:         TKAFG1K_ERROR_INIT_FAIL  
Description:    Instrument driver initialization fails.                       
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviFgen  Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviFgen  Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    The ViSession handle that you obtain from the tkafg1k_init or tkafg1k_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
     �    Pass the maximum number of bytes to read from the instruments.  

Valid Range:  0 to the number of elements in the Read Buffer.

Default Value: 0

     ^    Returns the number of bytes actually read from the instrument and stored in the Read Buffer.   �$ >Q �  �    Read Buffer                      ������  �    Status                           �i   �  �    Instrument Handle                �! >  �  �    Number of Bytes To Read          Ѿ �j �  �    Num Bytes Read                     	            	               0    	         ����         �  ;b             K.        init                                                                                                                                    ����         =R  m4             K.        InitWithOptions                                                                                                                         ����         o�  �             K.        ConfigureOperationMode                                                                                                                  ����         ��  ��             K.        ConfigureOutputMode                                                                                                                     ����         ��  �i             K.        ConfigureOutputModeByChannel                                                                                                            ����         ķ  נ             K.        ConfigureOutputImpedance                                                                                                                ����         ؓ  �i             K.        ConfigureOutputEnabled                                                                                                                  ����         �s  ��             K.        ConfigurePulseDutyCycle                                                                                                                 ����         � 1P             K.        ConfigureStandardWaveform                                                                                                               ����        3� F�             K.        ConfigureSampleRate                                                                                                                     ����        G� ^             K.        CreateArbWaveform                                                                                                                       ����        _J v�             K.        CreateStandardShapeArbWfm                                                                                                               ����        x\ �             K.        GetArbitraryWaveformBySlot                                                                                                              ����        �� �#             K.        CreateArbWaveformBySlot                                                                                                                 ����        �� ��             K.        CreateStandardShapeArbWfmBySlot                                                                                                         ����        �? դ             K.        QueryArbWfmCapabilities                                                                                                                 ����        �" ��             K.        ConfigureArbWaveform                                                                                                                    ����        �V              K.        ConfigureArbFrequency                                                                                                                   ����          K             K.        ConfigureBurstEnabled                                                                                                                   ����        !H 4)             K.        ConfigureBurstCount                                                                                                                     ����        5 IF             K.        ConfigureBurstMode                                                                                                                      ����        J� \�             K.        ConfigureNoiseAppendantEnabled                                                                                                          ����        ]� o�             K.        ConfigureNoiseLevel                                                                                                                     ����        p� ��             K.        ConfigureExternalAppendEnabled                                                                                                          ����        �� ��             K.        ConfigureAMEnabled                                                                                                                      ����        �� �V             K.        ConfigureAMSource                                                                                                                       ����        �� ��             K.        ConfigureAMInternal                                                                                                                     ����        �� ��             K.        ConfigureAMInternalByChannel                                                                                                            ����        � �             K.        ConfigureAMExternalByChannel                                                                                                            ����        �  
              K.        ConfigureFMEnabled                                                                                                                      ����        * �             K.        ConfigureFMSource                                                                                                                       ����        � =%             K.        ConfigureFMInternal                                                                                                                     ����        @ _�             K.        ConfigureFMInternalByChannel                                                                                                            ����        c! |             K.        ConfigureFMExternalByChannel                                                                                                            ����        }
 ��             K.        ConfigurePMEnabled                                                                                                                      ����        �� �             K.        ConfigurePMSource                                                                                                                       ����        �W ��             K.        ConfigurePMInternalByChannel                                                                                                            ����        �� �A             K.        ConfigurePMExternalByChannel                                                                                                            ����        �2 �9             K.        ConfigureFSKEnabled                                                                                                                     ����        �C ��             K.        ConfigureFSKSource                                                                                                                      ����        �� g             K.        ConfigureFSKInternalByChannel                                                                                                           ����        � ,h             K.        ConfigureFSKExternalByChannel                                                                                                           ����        -^ ?u             K.        ConfigurePWMEnabled                                                                                                                     ����        @ R�             K.        ConfigurePWMSource                                                                                                                      ����        T5 o;             K.        ConfigurePWMInternalByChannel                                                                                                           ����        r� ��             K.        ConfigurePWMExternalByChannel                                                                                                           ����       ���� �)             K.        ConfigureASKEnabled                                                                                                                     ����       ���� �"             K.        ConfigureASKSource                                                                                                                      ����       ���� ��             K.        ConfigureASKInternalByChan                                                                                                              ����       ���� ��             K.        ConfigureASKExternalByChan                                                                                                              ����       ���� �Y             K.        ConfigurePSKEnabled                                                                                                                     ����       ���� �R             K.        ConfigurePSKSource                                                                                                                      ����       ���� 	$             K.        ConfigurePSKInternalByChan                                                                                                              ����       ���� �             K.        ConfigurePSKExternalByChan                                                                                                              ����        � 9A             K.        SetAttributeViInt32                                                                                                                     ����        :w W�             K.        SetAttributeViReal64                                                                                                                    ����        Y vu             K.        SetAttributeViString                                                                                                                    ����        w� �             K.        SetAttributeViBoolean                                                                                                                   ����        �H ��             K.        SetAttributeViSession                                                                                                                   ����        �� �"             K.        GetAttributeViInt32                                                                                                                     ����        �` �             K.        GetAttributeViReal64                                                                                                                    ����        �� �             K.        GetAttributeViString                                                                                                                    ����        : (�             K.        GetAttributeViBoolean                                                                                                                   ����        )� C             K.        GetAttributeViSession                                                                                                                   ����        D? ]=             K.        CheckAttributeViInt32                                                                                                                   ����        ^s wu             K.        CheckAttributeViReal64                                                                                                                  ����        x� ��             K.        CheckAttributeViString                                                                                                                  ����        �� ��             K.        CheckAttributeViBoolean                                                                                                                 ����        � �             K.        CheckAttributeViSession                                                                                                                 ����        �R �R             K.        InitiateGeneration                                                                                                                      ����        �� ��             K.        AbortGeneration                                                                                                                         ����        �G �	             K.        CopyWfmDataBetweenEditMemory                                                                                                            ����        �� �             K.        SetGetWaveformPointValue                                                                                                                ����        � %�             K.        reset                                                                                                                                   ����        &: ,�             K.        ResetWithDefaults                                                                                                                       ����        - 3              K.        Disable                                                                                                                                 ����        3z D�             K.        revision_query                                                                                                                          ����        E� V^             K.        error_query                                                                                                                             ����        WZ �             K.        error_message                                                                                                                           ����        �  ��             K.        InvalidateAllAttributes                                                                                                                 ����        �f ��             K.        GetChannelName                                                                                                                          ����        �� �Z             K.        GetError                                                                                                                                ����        ؒ �             K.        ClearError                                                                                                                              ����        � +             K.        GetNextCoercionRecord                                                                                                                   ����        	" #�             K.        GetNextInterchangeWarning                                                                                                               ����        $� 4�             K.        ClearInterchangeWarnings                                                                                                                ����        5+ K�             K.        ResetInterchangeCheck                                                                                                                   ����        L h�             K.        LockSession                                                                                                                             ����        iL �Y             K.        UnlockSession                                                                                                                           ����        � ��             K.        viWrite                                                                                                                                 ����        �( ��             K.        viRead                                                                                                                                  ����        �� �
             K.        close                                                                                                                                   ����        �� �:             K.        WriteInstrData                                                                                                                          ����        �� �$             K.        ReadInstrData                                                                                                                                 9                                                                                     �Initialize                                                                           �Initialize With Options                                                             /Configuration Functions                                                              �Configure Operation Mode                                                             �Configure Output Mode                                                                �Configure Output Mode By Chan                                                        �Configure Output Impedance                                                           �Configure Output Enabled                                                            �Standard Function Output                                                             �Configure Pulse Duty Cycle                                                           �Configure Standard Waveform                                                         aArbitrary Output                                                                     �Configure Sample Rate                                                               	�Arbitrary Waveform                                                                  
cCreate Arbitrary Waveform                                                            �Create Arbitrary Waveform                                                            �Create Standard Shape Arb Wfm                                                        �Get Arbitrary Waveform by Slot                                                       �Create Arbitrary Waveform by Slot                                                    �Create Standard Shape Arb Wfm by Slot                                                �Query Arb Waveform Capabilities                                                      �Configure Arbitrary Waveform                                                        
�Arbitrary Waveform Frequency                                                         �Configure Arb Frequency                                                             4Bursting                                                                             �Configure Burst Enabled                                                              �Configure Burst Count                                                                �Configure Burst Mode                                                                �Waveform Appendant                                                                   �Configure Noise Append Enabled                                                       �Configure Noise Level                                                                �Configure Ext Append Enabled                                                        �Amplitude Modulation                                                                 �Configure AM Enabled                                                                 �Configure AM Source                                                                  �Configure AM Internal                                                                �Configure AM Internal By Chan                                                        �Configure AM External By Chan                                                       �Frequency Modulation                                                                 �Configure FM Enabled                                                                 �Configure FM Source                                                                  �Configure FM Internal                                                                �Configure FM Internal By Chan                                                        �Configure FM External By Chan                                                       �Phase Modulation                                                                     �Configure PM Enabled                                                                 �Configure PM Source                                                                  �Configure PM Internal By Chan                                                        �Configure PM External By Chan                                                       BFSK Modulation                                                                       �Configure FSK Enabled                                                                �Configure FSK Source                                                                 �Configure FSK Internal By Chan                                                       �Configure FSK External By Chan                                                      �PWM Modulation                                                                       �Configure PWM Enabled                                                                �Configure PWM Source                                                                 �Configure PWM Internal By Chan                                                       �Configure PWM External By Chan                                                    ����ASK Modulation                                                                       �Configure ASK Enabled                                                                �Configure ASK Source                                                                 �Configure ASK Internal By Chan                                                       �Configure ASK External By Chan                                                    ����PSK Modulation                                                                       �Configure PSK Enabled                                                                �Configure PSK Source                                                                 �Configure PSK Internal By Chan                                                       �Configure PSK External By Chan                                                      �Set/Get/Check Attribute                                                             Set Attribute                                                                        �Set Attribute ViInt32                                                                �Set Attribute ViReal64                                                               �Set Attribute ViString                                                               �Set Attribute ViBoolean                                                              �Set Attribute ViSession                                                             �Get Attribute                                                                        �Get Attribute ViInt32                                                                �Get Attribute ViReal64                                                               �Get Attribute ViString                                                               �Get Attribute ViBoolean                                                              �Get Attribute ViSession                                                             .Check Attribute                                                                      �Check Attribute ViInt32                                                              �Check Attribute ViReal64                                                             �Check Attribute ViString                                                             �Check Attribute ViBoolean                                                            �Check Attribute ViSession                                                           �Action/Status Functions                                                              �Initiate Generation                                                                  �Abort Generation                                                                    2Utility Functions                                                                    �Copy Wfm Data Between Edit Memory                                                    �Set Get Waveform Point Value                                                         �Reset                                                                                �Reset With Defaults                                                                  �Disable                                                                              �Revision Query                                                                       �Error-Query                                                                          �Error Message                                                                        �Invalidate All Attributes                                                            �Get Channel Name                                                                    �Error Info                                                                           �Get Error                                                                            �Clear Error                                                                         �Coercion Info                                                                        �Get Next Coercion Record                                                            :Interchangeability Info                                                              �Get Next Interchange Warning                                                         �Clear Interchange Warnings                                                           �Reset Interchange Check                                                             �Locking                                                                              �Lock Session                                                                         �Unlock Session                                                                      �System                                                                               �Write Bytes                                                                          �Read Bytes                                                                           �Close                                                                             ����Obsolete                                                                            MInstrument I/O                                                                       �Write Instrument Data                                                                �Read Instrument Data                                                            