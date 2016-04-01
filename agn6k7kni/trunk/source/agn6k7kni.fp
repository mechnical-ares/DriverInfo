s��           � .�  P�   �   %����                               agn6k7kni                       Agilent N6900/N7900 Series APS              _VI_FUNC                                                     � ��ViAttr     � ��ViConstString*     �  ViConstString[]     � ��ViConstString     � ��ViByte*     �  ViByte[]     � ��ViByte      ��ViChar*       ViChar[]      ��ViChar     	 	��ViReal64*     
  	ViReal64[]      ��ViReal64      ��ViInt8*       ViInt8[]      ��ViInt8     $ ��ViInt16*     	%  ViInt16[]     & ��ViInt16     . ��ViInt32*     	/  ViInt32[]     0 ��ViInt32     8 ��ViInt64*     	9  ViInt64[]     : ��ViInt64     
B 
��ViSession*     C 	 
ViSession[]     	D 	��ViSession     
L 
��ViBoolean*     M 	 
ViBoolean[]     	N 	��ViBoolean     V ��ViRsrc*     W  ViRsrc[]     X ��ViRsrc     	` 	��ViStatus*     
a  	ViStatus[]     b ��ViStatus   �    This instrument driver contains programming support for the Agilent N6900/N7900 Series Advanced Power System.  This driver has all the functions that IVI and VXIplug&play require.  

Note:  This driver requires the VISA and IVI libraries.       �    This class contains functions that configure the instrument.  The class includes high-level functions that configure multiple instrument settings as well as low-level functions that set, get, and check individual attribute values.     I    This class contains functions that programs output settings of the APS.     R    This class contains functions that programs advanced output settings of the APS.     T    This class contains functions that configures the measurement settings of the APS.     `    This class contains functions that configures the measurement acquisition settings of the APS.     R    This class contains functions that configures the transient settings of the APS.     v    This class contains functions that configures the list settings of the APS. 

This class supports N79XX models only.     �    This class contains functions that configures the arbitrary waveform settings of the APS.

This class supports N79XX models only.     S    This class contains functions that configures the protection settings of the APS.     O    This class contains functions that configures the system settings of the APS.     X    This class contains functions that configures the digital IO port settings of the APS.     Z    This class contains functions that configures the signal expression settings of the APS.     Y    This class contains functions that configures the external datalog settings of the APS.     T    This class contains functions that configures the calibration settings of the APS.     T    This class contains sub-classes for the set, get, and check attribute functions.       �    This class contains functions that set an attribute to a new value.  There are typesafe functions for each attribute data type.     �    This class contains functions that obtain the current value of an attribute.  There are typesafe functions for each attribute data type.     �    This class contains functions that obtain the current value of an attribute.  There are typesafe functions for each attribute data type.     \    This class contains functions that initiate instrument operations and report their status.     \    The class contains functions that give low-level control over the transient system system.     �    This class contains functions and sub-classes that initiate and retrieve measurements using the current configuration.  

The class contains a high-level read function for acquisition system.     �    The class contains functions that give low-level control over the acquisition system and external datalog system.  The functions perform the following operations:

- intiate 
- fetch  
- abort    _    This class contains functions and sub-classes that control common instrument operations.  These functions include many of functions that VXIplug&play require, such as reset, self-test, revision query, error query, and error message.  This class also contains functions that access IVI error infomation, lock the session, and perform instrument I/O.
     R    This class contains functions that retrieve and clear the IVI error information.     ?    This class contains functions that retrieve coercion records.     J    This class contains functions that retrieve interchangeability warnings.     k    This class contains functions that lock and unlock IVI instrument driver sessions for multithread safefy.     F    This class contains functions that send and receive instrument data.    G    This function performs the following initialization actions:

- Creates a new IVI instrument driver session.

- Opens a session to the specified device using the interface and address you specify for the Resource Name parameter.

- If the ID Query parameter is set to VI_TRUE, this function queries the instrument ID and checks that it is valid for this instrument driver.

- If the Reset parameter is set to VI_TRUE, this function resets the instrument to a known state.

- Sends initialization commands to set the instrument to the state necessary for the operation of the instrument driver.

- Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Note:  This function creates a new session each time you invoke it. Although you can open more than one IVI session for the same resource, it is best not to do so.  You can use the same session in multiple program threads.  You can use the agn6k7kni_LockSession and agn6k7kni_UnlockSession functions to protect sections of code that require exclusive access to the resource.

Content from the IVI specifications reproduced with permission from the IVI Foundation. 
 
The IVI Foundation and its member companies make no warranty of any kind with regard to this material, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose. The IVI Foundation and its member companies shall not be liable for errors contained herein or for incidental or consequential damages in connection with the furnishing, performance, or use of this material.    �    Pass the resource name of the device to initialize.

You can also pass the name of a virtual instrument or logical name that you configure with the IVI Configuration utility.  The virtual instrument identifies a specific device and specifies the initial settings for the session.  A logical Name identifies a particular virtual instrument.

Refer to the following table below for the exact grammar to use for this parameter.  Optional fields are shown in square brackets ([]).

Syntax
------------------------------------------------------
GPIB[board]::<primary address>[::secondary address]::INSTR
VXI[board]::<logical address>::INSTR
GPIB-VXI[board]::<logical address>::INSTR
ASRL<port>::INSTR
<LogicalName>
<DriverSession>

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

Default Value:  "TCPIP0::A-N7952A-40001::inst0::INSTR"
        Specify whether you want the instrument driver to perform an ID Query.

Valid Range:
VI_TRUE  (1) - Perform ID Query (Default Value)
VI_FALSE (0) - Skip ID Query

When you set this parameter to VI_TRUE, the driver verifies that the instrument you initialize is a type that this driver supports.  

Circumstances can arise where it is undesirable to send an ID Query command string to the instrument.  When you set this parameter to VI_FALSE, the function initializes the instrument without performing an ID Query.     �    Specify whether you want the instrument driver to reset the instrument during the initialization procedure.

Valid Range:
VI_TRUE  (1) - Reset Device (Default Value)
VI_FALSE (0) - Don't Reset

    �    Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Notes:

(1) This function creates a new session each time you invoke it.  This is useful if you have multiple physical instances of the same type of instrument.  

(2) Avoid creating multiple concurrent sessions to the same physical instrument.  Although you can create more than one IVI session for the same resource, it is best not to do so.  A better approach is to use the same IVI session in multiple execution threads.  You can use functions agn6k7kni_LockSession and agn6k7kni_UnlockSession to protect sections of code that require exclusive access to the resource.

    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the agn6k7kni_error_message function.  To obtain additional information about the error condition, call the agn6k7kni_GetError function.  To clear the error information from the driver, call the agn6k7kni_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
None

ERRORS:
AGN6K7KNI_ERROR_INVALID_OPTION_TYPE 
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviDCPwr Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviDCPwr Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

    � =   X  �    Resource Name                     � : N       ID Query                          !� =� N       Reset Device                      "Y#  D  �    Instrument Handle                 %#���b  �    Status                          ����  g��                                            '"TCPIP0::A-N7952A-40001::inst0::INSTR"   Yes VI_TRUE No VI_FALSE   Yes VI_TRUE No VI_FALSE    	           	           FCopyright 2014 National Instruments Corporation. All Rights Reserved.   W    This function performs the following initialization actions:

- Creates a new IVI instrument driver and optionally sets the initial state of the following session attributes:

    AGN6K7KNI_ATTR_RANGE_CHECK         
    AGN6K7KNI_ATTR_QUERY_INSTRUMENT_STATUS  
    AGN6K7KNI_ATTR_CACHE               
    AGN6K7KNI_ATTR_SIMULATE            
    AGN6K7KNI_ATTR_RECORD_COERCIONS    

- Opens a session to the specified device using the interface and address you specify for the Resource Name parameter.

- If the ID Query parameter is set to VI_TRUE, this function queries the instrument ID and checks that it is valid for this instrument driver.

- If the Reset parameter is set to VI_TRUE, this function resets the instrument to a known state.

- Sends initialization commands to set the instrument to the state necessary for the operation of the instrument driver.

- Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Note:  This function creates a new session each time you invoke it. Although you can open more than one IVI session for the same resource, it is best not to do so.  You can use the same session in multiple program threads.  You can use the agn6k7kni_LockSession and agn6k7kni_UnlockSession functions to protect sections of code that require exclusive access to the resource.

Content from the IVI specifications reproduced with permission from the IVI Foundation. 
 
The IVI Foundation and its member companies make no warranty of any kind with regard to this material, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose. The IVI Foundation and its member companies shall not be liable for errors contained herein or for incidental or consequential damages in connection with the furnishing, performance, or use of this material.    �    Pass the resource name of the device to initialize.

You can also pass the name of a virtual instrument or logical name that you configure with the IVI Configuration utility.  The virtual instrument identifies a specific device and specifies the initial settings for the session.  A logical Name identifies a particular virtual instrument.

Refer to the following table below for the exact grammar to use for this parameter.  Optional fields are shown in square brackets ([]).

Syntax
------------------------------------------------------
GPIB[board]::<primary address>[::secondary address]::INSTR
VXI[board]::<logical address>::INSTR
GPIB-VXI[board]::<logical address>::INSTR
ASRL<port>::INSTR
<LogicalName>
<DriverSession>

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

Default Value:  "TCPIP0::A-N7952A-40001::inst0::INSTR"
        Specify whether you want the instrument driver to perform an ID Query.

Valid Range:
VI_TRUE  (1) - Perform ID Query (Default Value)
VI_FALSE (0) - Skip ID Query

When you set this parameter to VI_TRUE, the driver verifies that the instrument you initialize is a type that this driver supports.  

Circumstances can arise where it is undesirable to send an ID Query command string to the instrument.  When you set this parameter to VI_FALSE, the function initializes the instrument without performing an ID Query.     �    Specify whether you want the instrument driver to reset the instrument during the initialization procedure.

Valid Range:
VI_TRUE  (1) - Reset Device (Default Value)
VI_FALSE (0) - Don't Reset

    �    Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Notes:

(1) This function creates a new session each time you invoke it.  This is useful if you have multiple physical instances of the same type of instrument.  

(2) Avoid creating multiple concurrent sessions to the same physical instrument.  Although you can create more than one IVI session for the same resource, it is best not to do so.  A better approach is to use the same IVI session in multiple execution threads.  You can use functions agn6k7kni_LockSession and agn6k7kni_UnlockSession to protect sections of code that require exclusive access to the resource.

    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the agn6k7kni_error_message function.  To obtain additional information about the error condition, call the agn6k7kni_GetError function.  To clear the error information from the driver, call the agn6k7kni_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
None

ERRORS:
AGN6K7KNI_ERROR_INVALID_OPTION_TYPE
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviDCPwr Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviDCPwr Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

    �    You can use this control to set the initial value of certain attributes for the session.  The following table lists the attributes and the name you use in this parameter to identify the attribute.

Name              Attribute Defined Constant   
--------------------------------------------
RangeCheck        AGN6K7KNI_ATTR_RANGE_CHECK
QueryInstrStatus  AGN6K7KNI_ATTR_QUERY_INSTRUMENT_STATUS   
Cache             AGN6K7KNI_ATTR_CACHE   
Simulate          AGN6K7KNI_ATTR_SIMULATE  
RecordCoercions   AGN6K7KNI_ATTR_RECORD_COERCIONS

The format of this string is, "AttributeName=Value" where AttributeName is the name of the attribute and Value is the value to which the attribute will be set.  To set multiple attributes, separate their assignments with a comma.

If you pass NULL or an empty string for this parameter and a VISA resource descriptor for the Resource Name parameter, the session uses the default values for the attributes. The default values for the attributes are shown below:

    Attribute Name     Default Value
    ----------------   -------------
    RangeCheck         VI_TRUE
    QueryInstrStatus   VI_FALSE
    Cache              VI_TRUE
    Simulate           VI_FALSE
    RecordCoercions    VI_FALSE
    

If you pass NULL or an empty string for this parameter and a virtual instrument or logical name for the Resource Name parameter, the session uses the values that you configure for virtual instrument or logical name with the IVI Configuration utility.

You can override the values of the attributes by assigning a value explicitly in a string you pass for this parameter.  You do not have to specify all of the attributes and may leave any of them out.  If you do not specify one of the attributes, its default value or the value that you configure with the IVI Configuration utility will be used.

The following are the valid values for ViBoolean attributes:

    True:     1, TRUE, or VI_TRUE
    False:    0, False, or VI_FALSE


Default Value:
"Simulate=0,RangeCheck=1,QueryInstrStatus=0,Cache=1"
    5/ =   X  �    Resource Name                     <0 :! N       ID Query                          >; =� N       Reset Device                      ?#  D  �    Instrument Handle                 A�#���b  �    Status                            H~ �   �    Option String                   ����  s��                                            '"TCPIP0::A-N7952A-40001::inst0::INSTR"   Yes VI_TRUE No VI_FALSE   Yes VI_TRUE No VI_FALSE    	           	           5"Simulate=0,RangeCheck=1,QueryInstrStatus=0,Cache=1"    FCopyright 2014 National Instruments Corporation. All Rights Reserved.    d    This function sets the output voltage level when the output is operating in voltage priority mode.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.    �    Sets the voltage level when the output is operating in voltage priority mode.

Valid Range:
N6950A, N6970A, N7950A and N7970A: 0.009 to 9.18 V
N6951A, N6971A, N7951A and N7971A: 0.02 to 20.4 V
N6952A, N6972A, N7952A and N7972A: 0.04 to 40.8 V
N6953A, N6973A, N7953A and N7973A: 0.06 to 61.2 V
N6954A, N6974A, N7954A and N7974A: 0.08 to 81.6 V
N6976A, N7976A: 0.12 to 122.4 V
N6977A, N7977A: 0.16 to 163.2 V

Default Value:
N6950A, N6970A, N7950A and N7970A: 0.009 V
N6951A, N6971A, N7951A and N7971A: 0.02 V
N6952A, N6972A, N7952A and N7972A: 0.04 V
N6953A, N6973A, N7953A and N7973A: 0.06 V
N6954A, N6974A, N7954A and N7974A: 0.08 V
N6976A, N7976A: 0.12 V
N6977A, N7977A: 0.16 V

SCPI Command:
[SOURce:]VOLTage[:LEVel][:IMMediate][:AMPLitude] <value>|MIN|MAX    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12    SQ-   D  �    Instrument Handle                 S� -    �    Channel Name                      T� -�   �    Level                             W�#���b  �    Status                                 "1"    0.009    	           S    This function configures the current protection state and positive current limit.     �    The ViSession handle that you obtain from the agn6k7kni_init or agn6k7kni_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.     �    This parameter is used to comply with the IVI DC Power specification.

Valid Values:
AGN6K7KNI_VAL_CURRENT_REGULATE - Regulate

Default Value:
AGN6K7KNI_VAL_CURRENT_REGULATE    R    Sets the positive current limit when in voltage priority mode.  Units are in amperes.  The maximum value depends on the current rating of the unit. 

Valid Range:
0 to 102% of rating. If current rating is 100%, then the valid range is: 
N6950A, N6970A, N7950A and N7970A: 0 to 102 A
N6951A, N6971A, N7951A and N7971A: 0 to 51 A
N6952A, N6972A, N7952A and N7972A: 0 to 25.5 A
N6953A, N6973A, N7953A, N7973A, N6976A and N7976A: 0 to 17 A
N6954A, N6974A, N7954A, N7974A, N6977A and N7977A: 0 to 12.75 A

Default Value:
N6950A, N6970A, N7950A and N7970A: 1.02 A
N6951A, N6971A, N7951A and N7971A: 0.51A
N6952A, N6972A, N7952A and N7972A: 0.255 A
N6953A, N6973A, N7953A, N7973A, N6976A and N7976A: 0.17 A
N6954A, N6974A, N7954A, N7974A, N6977A and N7977A: 0.1275 A

SCPI Command:
[SOURce:]CURRent:LIMit[:POSitive][:IMMediate][:AMPLitude] <value>|MIN|MAX    ^�-   D  �    Instrument Handle                 _�#���b  �    Status                            e> 3 
   �    Channel Name                      f4 3 � 0 �    Behavior                          f� 3�   �    Limit                                  	           "1"               (Regulate AGN6K7KNI_VAL_CURRENT_REGULATE    1.02    6    This function configures the negative current limit.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.    �    Sets the negative current limit when in voltage priority mode.  Units are in amperes.  The minimum value is the most negative value.

Valid Range:
-10.2% of rating to 0 without power dissipator, If current rating is 100%, then the valid range is: 
N6950A, N6970A, N7950A and N7970A: -10.2 to 0 A
N6951A, N6971A, N7951A and N7971A: -5.1 to 0 A
N6952A, N6972A, N7952A and N7972A: -2.55 to 0 A
N6953A, N6973A, N7953A, N7973A, N6976A and N7976A: -1.7 to 0 A
N6954A, N6974A, N7954A, N7974A, N6977A and N7977A: -1.275 to 0 A

up to -102% of rating to 0 with power dissipator, If current rating is 100%, then the valid range is: 
N6950A, N6970A, N7950A and N7970A: -102 to 0 A
N6951A, N6971A, N7951A and N7971A: -51 to 0 A
N6952A, N6972A, N7952A and N7972A: -25.5 to 0 A
N6953A, N6973A, N7953A, N7973A, N6976A and N7976A: -17 to 0 A
N6954A, N6974A, N7954A, N7974A, N6977A and N7977A: -12.75 to 0 A

Default Value:
N6950A, N6970A, N7950A and N7970A: -10.2 A
N6951A, N6971A, N7951A and N7971A: -5.1 A
N6952A, N6972A, N7952A and N7972A: -2.55 A
N6953A, N6973A, N7953A, N7973A, N6976A and N7976A: -1.7 A
N6954A, N6974A, N7954A, N7974A, N6977A and N7977A: -1.275 A

SCPI Command:
[SOURce:]CURRent:LIMit:NEGative[:IMMediate][:AMPLitude] <value>|MIN|MAX    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12    k�-   D  �    Instrument Handle                 l� -    �    Channel Name                      mw -�   �    Limit                             rX#���b  �    Status                                 "1"    -10.2    	           ]    This function sets the current level when the output is operating in current priority mode.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.    �    Sets the current level when the output is operating in current priority mode.

Valid Range:
-10.2% to 102% of rating without power dissipator, If current rating is 100%, then the valid range is: 
N6950A, N6970A, N7950A and N7970A: -10.2 to 102 A
N6951A, N6971A, N7951A and N7971A: -5.1 to 51 A
N6952A, N6972A, N7952A and N7972A: -2.55 to 25.5 A
N6953A, N6973A, N7953A, N7973A, N6976A and N7976A: -1.7 to 17 A
N6954A, N6974A, N7954A, N7974A, N6977A and N7977A: -1.275 to 12.75 A


up to -102% to 102% of rating with power dissipator, If current rating is 100%, then the valid range is: 
N6950A, N6970A, N7950A and N7970A: -102 to 102 A
N6951A, N6971A, N7951A and N7971A: -51 to 51 A
N6952A, N6972A, N7952A and N7972A: -25.5 to 25.5 A
N6953A, N6973A, N7953A, N7973A, N6976A and N7976A: -17 to 17 A
N6954A, N6974A, N7954A, N7974A, N6977A and N7977A: -12.75 to 12.75 A

Default Value:
N6950A, N6970A, N7950A and N7970A: 1.02 A
N6951A, N6971A, N7951A and N7971A: 0.51 A
N6952A, N6972A, N7952A and N7972A: 0.255 A
N6953A, N6973A, N7953A, N7973A, N6976A and N7976A: 0.17 A
N6954A, N6974A, N7954A, N7974A, N6977A and N7977A: 0.1275 A

SCPI Command:
[SOURce:]CURRent[:LEVel][:IMMediate][:AMPLitude] <value>|MIN|MAX    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12    yW-   D  �    Instrument Handle                 y� -    �    Channel Name                      z� -�   �    Level                             �#���b  �    Status                                 "1"    1.02    	           E    This function sets the voltage limit when in current priority mode.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.    �    Sets the voltage limit when in current priority mode.

Valid Range:
N6950A, N6970A, N7950A and N7970A: 0.009 to 9.18 V
N6951A, N6971A, N7951A and N7971A: 0.02 to 20.4 V
N6952A, N6972A, N7952A and N7972A: 0.04 to 40.8 V
N6953A, N6973A, N7953A and N7973A: 0.06 to 61.2 V
N6954A, N6974A, N7954A and N7974A: 0.08 to 81.6 V
N6976A, N7976A: 0.12 to 122.4 V
N6977A, N7977A: 0.16 to 163.2 V

Default Value:
N6950A, N6970A, N7950A and N7970A: 9.18 V
N6951A, N6971A, N7951A and N7971A: 20.4 V
N6952A, N6972A, N7952A and N7972A: 40.8 V
N6953A, N6973A, N7953A and N7973A: 61.2 V
N6954A, N6974A, N7954A and N7974A: 81.6 V
N6976A, N7976A: 122.4 V
N6977A, N7977A: 163.2 V

SCPI Command:
[SOURce:]VOLTage:LIMit[:POSitive][:IMMediate][:AMPLitude] <value>|MIN|MAX    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12    ��-   D  �    Instrument Handle                 �0 -    �    Channel Name                      �& -�   �    Limit                             �#���b  �    Status                                 "1"    9.18    	              This function selects either voltage priority or current priority mode.

Voltage priority mode is used when you want the output voltage to remain constant. The output voltage will remain at its programmed setting as long as the load current remains within the positive or negative current limit setting.

Current priority mode is used when you want the output current to remain constant. The output current will remain at its programmed setting as long as the load voltage remains within the voltage limit setting.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None        Select either Voltage priority or Current priority. 

Valid Values:
AGN6K7KNI_VAL_FUNCTION_VOLTAGE - Voltage priority, the output voltage will remain at its programmed setting as long as the load current remains within the positive or negative current limit setting.
AGN6K7KNI_VAL_FUNCTION_CURRENT - Current priority,  the output current will remain at its programmed setting as long as the load voltage remains within the voltage limit setting.

Default Value:
AGN6K7KNI_VAL_FUNCTION_CURRENT

SCPI Command:
[SOURce:]FUNCtion CURRent|VOLTage    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.    ��-   D  �    Instrument Handle                 �] (� 0 �    Priority Mode                     ��#���b  �    Status                            �* (    �    Channel Name                                      `Voltage Priority AGN6K7KNI_VAL_FUNCTION_VOLTAGE Current Priority AGN6K7KNI_VAL_FUNCTION_CURRENT    	           "1"    O    This function sets the output turn-on and turn-off sequence delay of the APS.     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.    �    Specifies the delay in seconds that the instrument waits before turning the output on (rise). This allows multiple instruments to turn on in sequence. The output will not turn on until its delay time has elapsed.

Valid Range:
Delay times can be programmed with the following resolution:
Range in seconds          Resolution
0 to 1.023E-4             100 nanoseconds
1.03E-4 to 1.023E-3       1 microsecond
1.03E-3 to 1.023E-2       10 microseconds
1.03E-2 to 1.023E-1       100 microseconds
1.03E-1 to 1.023E+0       1 millisecond
1.03E+0 to 1.023E+1       10 milliseconds
1.03E+1 to 1.023E+2       100 milliseconds
1.03E+2 to 1.023E+3       1 second

Default Value:
0

SCPI Command:
OUTPut[:STATe]:DELay:RISE <value>|MIN|MAX    �    Specifies the delay in seconds that the instrument waits before turning the output off (fall). This allows multiple instruments to turn off in sequence. The output will not turn off until its delay time has elapsed.

Valid Range:
Delay times can be programmed with the following resolution:
Range in seconds          Resolution
0 to 1.023E-4             100 nanoseconds
1.03E-4 to 1.023E-3       1 microsecond
1.03E-3 to 1.023E-2       10 microseconds
1.03E-2 to 1.023E-1       100 microseconds
1.03E-1 to 1.023E+0       1 millisecond
1.03E+0 to 1.023E+1       10 milliseconds
1.03E+1 to 1.023E+2       100 milliseconds
1.03E+2 to 1.023E+3       1 second

Default Value:
0

SCPI Command:
OUTPut[:STATe]:DELay:FALL <value>|MIN|MAX     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12    �� -    �    Channel Name                      �� - �   �    Rise Delay                        �� -�   �    Fall Delay                        ��-   D  �    Instrument Handle                 �)#���b  �    Status                             "1"    0    0        	           <    This function configures the output sequencing of the APS.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None    W    Enables or disables output coupling. Output coupling allows the outputs of multiple instruments to turn on and off sequentially according to their specified programming delays.

Valid Values:
VI_TRUE - Enables output coupling
VI_FALSE - Disables output coupling

Default Value:
VI_TRUE

SCPI Command:
OUTPut[:STATe]:COUPle[:STATe] 0|OFF|1|ON     �    Sets a delay offset to synchronize coupled output state changes.

Valid Range:
0 to 1.023

Default Value:
0

SCPI Command:
OUTPut[:STATe]:COUPle:DOFFset <value>|MIN|MAX    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12    �=-   D  �    Instrument Handle                 �� - Q N  �    Coupling Enabled                  �; -�   �    Delay Offset                      ��#���b  �    Status                                True VI_TRUE False VI_FALSE    0    	           7    This function configures the output state of the APS.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.    �    Enables or disables the output. The state of a disabled output is a condition of zero output voltage and zero source current. If output and sense relays are installed, the relays will open when the output is disabled and close when the output is enabled.

Valid Values:
VI_TRUE - Enables the output
VI_FALSE - Disables the output

Default Value:
VI_FALSE

Notes:
(1) Because of internal circuit start-up procedures and any installed relay options, turn output on may take between 12 and 38 milliseconds to complete its function in voltage priority mode, and between 14 and 46 milliseconds in current priority mode.

SCPI Command:
OUTPut[:STATe]:COUPle[:STATe] 0|OFF|1|ON    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12    ��-   D  �    Instrument Handle                 �y -    �    Channel Name                      �o -� N  �    Enabled                           �#���b  �    Status                                 "1"    True VI_TRUE False VI_FALSE    	           c    This function configures the output relay. 

Notes:
(1) This function supports N79XX models only.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.     �    Enables or disables the polarity reversal function.

Valid Values:
VI_TRUE - Enables output relay polarity
VI_FALSE - Disables output relay polarity

Default Value:
VI_TRUE

SCPI Command:
OUTPut:RELay:POLarity:ENABle 0|OFF|1|ON    �    Sets the polarity of the output relays. Polarity reversal affects both the output and the sense terminals. 

Valid Values:
AGN6K7KNI_VAL_RELAY_POLARITY_NORMAL - Normal, causes the output polarity to be the same as the output connector labeling.
AGN6K7KNI_VAL_RELAY_POLARITY_REVERSE - Reverse, causes the output polarity to be the reverse of the output connector labeling.

Default Value:
AGN6K7KNI_VAL_RELAY_POLARITY_NORMAL

SCPI Command:
OUTPut:RELay:POLarity NORMal|REVerse    w    Enables or disables the locked-closed state of the output relays. When locked, the output relays remain closed and do not change with the output state. 

Valid Values:
VI_TRUE - Enables the locked-closed state of the output relays.
VI_FALSE - Disables the locked-closed state of the output relays.

Default Value:
VI_FALSE

SCPI Command:
OUTPut:RELay:LOCK[:STATe]0|OFF|1|ON    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12    �2-   D  �    Instrument Handle                 �� -    �    Channel Name                      �� - N  �    Polarity Enabled                  Ĵ -� 0 �    Polarity                          ƙ � P N  �    Lock Enabled                      �#���b  �    Status                                 "1"   True VI_TRUE False VI_FALSE               XNormal AGN6K7KNI_VAL_RELAY_POLARITY_NORMAL Reverse AGN6K7KNI_VAL_RELAY_POLARITY_REVERSE    True VI_TRUE False VI_FALSE    	           >    Configures the current sharing settings on paralleled units.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.        Enables or disables current sharing on paralleled units.

Valid Values:
VI_TRUE - Enable, the load current is shared equally among the paralleled outputs.
VI_FALSE - Disable

Default Value:
VI_FALSE

SCPI Command:
[SOURce:]CURRent:SHARing[:STATe] 0|OFF|1|ON    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12    ��-   D  �    Instrument Handle                 Н -    �    Channel Name                      ѓ -� N  �    Current Sharing Enabled           Ҟ#���b  �    Status                                 "1"    True VI_TRUE False VI_FALSE    	           �    This function sets the voltage bandwidth modes. Voltage bandwidth modes allow you to optimize output response time with capacitive loads.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.    �    Sets the voltage bandwidth. This lets you optimize output response time with capacitive loads.

Valid Values:
AGN6K7KNI_VAL_VOLTAGE_BANDWIDTH_HIGH - High Bandwidth,  provides maximum up-programming speed as well as the fastest transient response time when the output capacitance is restricted to small values. This mode is optimized for use with resistive loads; however capacitive loads up to the limits outlined in the table below can be used when using load leads shorter than 3 meters (10 feet). Exceeding these limits can lead to voltage programming overshoots and transient response instability.

AGN6K7KNI_VAL_VOLTAGE_BANDWIDTH_LOW - Low Bandwidth, optimized for use with large capacitive loads up to the limits shown in the table below, along with load leads longer than 3 meters (10 feet). In this mode the up- and down-programming speed and voltage control-loop bandwidth are limited to prevent voltage programming overshoots and improve transient response stability. Low mode provides the best stability and overshoot minimization over all load configurations.
------------------------------------------------------
1 kW Models      High limit        Low limit
N6950A/N7950A    0 to 3800 uF      0 to 190,000 uF
N6951A/N7951A    0 to 1000 uF      0 to 50,000 uF
N6952A/N7952A    0 to 240 uF       0 to 12,000 uF
N6953A/N7953A    0 to 100 uF       0 to 5600 uF
N6954A/N7954A    0 to 60 uF        0 to 3000 uF
------------------------------------------------------
2 kW Models      High limit        Low limit
N6970A/N7970A    0 to 7600 uF      0 to 380,000 uF      
N6971A/N7971A    0 to 2000 uF      0 to 100,000 uF
N6972A/N7972A    0 to 480 uF       0 to 24,000 uF
N6973A/N7973A    0 to 200 uF       0 to 11,200 uF
N6974A/N7974A    0 to 120 uF       0 to 6000 uF
N6976A/N7976A    0 to 50 uF        0 to 2,800 uF
N6977A/N7977A    0 to 30 uF        0 to 1,500 uF
------------------------------------------------------

Default Value:
AGN6K7KNI_VAL_VOLTAGE_BANDWIDTH_HIGH

Notes:
(1) Connecting very low ESR capacitors larger than the High mode limit with load leads shorter than 3 m (10 ft.) is not recommended in either bandwidth range. This load configuration can lead to voltage programming overshoots.

SCPI Command:
[SOURce:]VOLTage:BWIDth LOW|HIGH1    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12    ��-   D  �    Instrument Handle                 ڀ -    �    Channel Name                      �v -� 0 �    Bandwidth                         �X#���b  �    Status                                 "1"               fHigh Bandwidth AGN6K7KNI_VAL_VOLTAGE_BANDWIDTH_HIGH Low Bandwidth AGN6K7KNI_VAL_VOLTAGE_BANDWIDTH_LOW    	          �    This function configures the output resistance of the APS. Output resistance programming is mainly used in battery testing applications and only applies in Voltage Priority mode. It is used to emulate the internal resistance of a non-ideal voltage source such as a battery.

Notes:
(1) Output resistance programming is mainly used in battery testing applications and only applies in Voltage Priority mode.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.     �    Enables or disables output resistance programming.

Valid Values:
VI_TRUE - Enables output resistance programming.
VI_FALSE - Disables output resistance programming.

Default Value:
VI_FALSE

SCPI Command:
[SOURce:]RESistance:STATe 0|OFF|1|ON        Sets the output resistance level. Units are in ohms.

Valid Range:
N6950A/N7950A: 0 to 0.1 Ohms
N6951A/N7951A: 0 to 0.4 Ohms
N6952A/N7952A: 0 to 1.6 Ohms
N6953A/N7953A: 0 to 3.4 Ohms
N6954A/N7954A: 0 to 6.4 Ohms
N6970A/N7970A: 0 to 0.05 Ohms
N6971A/N7971A: 0 to 0.2 Ohms
N6972A/N7972A: 0 to 0.8 Ohms
N6973A/N7973A: 0 to 1.7 Ohms
N6974A/N7974A: 0 to 3.2 Ohms
N6976A/N7976A: 0 to 6.8 Ohms
N6977A/N7977A: 0 to 12.8 Ohms

Default Value:
0

SCPI Command:
[SOURce:]RESistance[:LEVel][:IMMediate][:AMPLitude] <value>|MIN|MAX    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12    ��-   D  �    Instrument Handle                 � -    �    Channel Name                      � - N  �    Resistance Enabled                � -�   �    Resistance                        �#���b  �    Status                                 "1"    True VI_TRUE False VI_FALSE    0    	              This function sets the voltage or current slew rate for the active priority mode.

Max slew rate (V/s) = (Current limit setting (A) - Load current (A))/(Load capacitance (F))

Notes:
(1) Use agn6k7kni_ConfigureOutputPriorityMode function to configure the active priority mode.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.        Sets the voltage slew rate. The slew rate is set in volts per second and affects all programmed voltage changes, including those due to the output state turning on or off.

Defined Values:
AGN6K7KNI_VAL_SLEW_RATE_MAX (-1) -  Enables the maximum slew rate override, the slew rate is set to its maximum value.

Valid Range:
AGN6K7KNI_VAL_SLEW_RATE_MAX
0 to 9.9E+37

Default Value:
AGN6K7KNI_VAL_SLEW_RATE_MAX

Notes:
(1) The VOLTAGE_SLEW_MAX_ENABLED attribute is coupled to the CURRENT_SLEW_MAX_ENABLED attribute. If VOLTAGE_SLEW_MAX_ENABLED is set to VI_TRUE, CURRENT_SLEW_MAX_ENABLED is enabled. If the slew rate is set to any other value, CURRENT_SLEW_MAX_ENABLED is disabled.

SCPI Command:
[SOURce:]VOLTage:SLEW[:IMMediate] <value>|MIN|MAX|INFinity
[SOURce:]VOLTage:SLEW:MAXimum 0|OFF|1|ON 
[SOURce:]CURRent:SLEW[:IMMediate] <value>|MIN|MAX|INFinity
[SOURce:]CURRent:SLEW:MAXimum 0|OFF|1|ON    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12    ��-   D  �    Instrument Handle                 �D -    �    Channel Name                      �: -)   �    Slew Rate                         ��#���b  �    Status                                 "1"    AGN6K7KNI_VAL_SLEW_RATE_MAX    	           m    This function configures the output range of the APS.

Notes:
(1) This function supports N79XX models only.     �    The ViSession handle that you obtain from the agn6k7kni_init or agn6k7kni_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.    �    Selects a DC current measurement range. Units are in amperes. 

Defined Values:
AGN6K7KNI_VAL_OUTPUT_RANGE_AUTO (-1000) - Seamless measurement autoranging.

Valid Range:
Without power dissipator: 
N7950A and N7970A: -10.2 to 102 A
N7951A and N7971A: -5.1 to 51 A
N7952A and N7972A: -2.55 to 25.5 A
N7953A, N7973A and N7956A: -1.7 to 17 A
N7954A, N7974A and N7957A: -1.275 to 12.75 A

With power dissipator: 
N7950A and N7970A: -102 to 102 A
N7951A and N7971A: -51 to 51 A
N7952A and N7972A: -25.5 to 25.5 A
N7953A, N7973A and N7956A: -17 to 17 A
N7954A, N7974A and N7957A: -12.75 to 12.75 A

Default Value:
AGN6K7KNI_VAL_OUTPUT_RANGE_AUTO

Notes:
(1) The value that you enter must be the highest value that you expect to measure. 
(2) The instrument selects the range with the best resolution for the value entered.

SCPI Command:
SENSe:CURRent[:DC]:RANGe[:UPPer] <value>|MIN|MAX 
SENSe:CURRent[:DC]:RANGe:AUTO 0|OFF|1|ON     �    This parameter is only used to apply with the IVI DC Power specification. 

Valid Values:
AGN6K7KNI_VAL_RANGE_CURRENT

Default Value:
AGN6K7KNI_VAL_RANGE_CURRENT   �-   D  �    Instrument Handle                �#���b  �    Status                           H 3 
   �    Channel Name                     > 3�   �    Range                            � 3 � 0 �    Range Type                             	           "1"     AGN6K7KNI_VAL_OUTPUT_RANGE_AUTO               $Current AGN6K7KNI_VAL_RANGE_CURRENT    �    This function configures the measurement sampling settings of the APS, including Points, Time Interval and Offset.

Notes:
(1) This function supports N79XX models only.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.     �    Defines the number of points in a measurement. 

The number of points depends on the line frequency (50 Hz or 60 Hz).

Valid Values:
1 to 524288

Default Value:
3255 (60 Hz)
3906 (50 Hz)

SCPI Command:
SENSe:SWEep:POINts <value>|MIN|MAX    n    Defines the time period between measurement samples.  Units are in seconds.

Valid Range:
0.00000512 to 40,000, Values are rounded to the nearest 20.48 microsecond increment. Below 20.48 microseconds, values are rounded to the nearest 10.24 or 5.12 microsecond increment respectively.

Default Value:
0.00000512

SCPI Command:
SENSe:SWEep:TINTerval <value>|MIN|MAX    U    Defines the offset in a data sweep for triggered measurements. Positive values represent the delay after the trigger occurs but before the samples are acquired. Negative values represent data samples taken prior to the trigger.

Valid Values:
-524287 to 2000000000

Default Value:
0

SCPI Command:
SENSe:SWEep:OFFSet:POINts <value>|MIN|MAX    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   �-   D  �    Instrument Handle                S -    �    Channel Name                     I - � 0  �    Points                           ? -�   �    Time Interval                    � �  0  �    Offset                           #���b  �    Status                                 "1"    3255    0.00000512    0    	           f    This function configures the measurement period expressed in number of power line cycles of the APS.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.    �    Sets the measurement time in number of power line cycles. Increasing the number of power line cycles reduces the measurement noise on current and voltage measurements. 

The number of points in 1 NPLC depends on the line frequency.

Valid Range:
0.0003072 to 1258290000000

Default Value:
1

Notes:
(1) Changing the NPLC changes the number of points and time interval setting.

SCPI Command:
SENSe:SWEep:NPLCycles <value>|MIN|MAX    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12    �-   D  �    Instrument Handle                !5 -    �    Channel Name                     "+ -�   �    NPLC                             #�#���b  �    Status                                 "1"    1    	           v    This function configures the measurement windowing of the APS.

Notes:
(1) This function supports N79XX models only.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.    :    Selects the measurement window. This sets a signal conditioning function used in scalar DC measurement calculations. 

Neither window function alters the instantaneous voltage or current data returned in the measurement array.

Valid Values:
AGN6K7KNI_VAL_MEAS_WINDOW_HANNING - Hanning, Hanning window is a "raised cosine" function. It is a signal conditioning function that reduces errors in DC measurement calculations in the presence of periodic signals such as AC line ripple. This window only works up to 4883 measurement points. The instrument will revert to a rectangular window when the points exceed 4883.
AGN6K7KNI_VAL_MEAS_WINDOW_RECT - Rectangular, returns measurement calculations with no signal conditioning.

Default Value:
AGN6K7KNI_VAL_MEAS_WINDOW_RECT

SCPI Command:
SENSe:WINDow[:TYPE] HANNing|RECTangular    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   *�-   D  �    Instrument Handle                +� -    �    Channel Name                     ,� -� 0 �    Window Type                      /�#���b  �    Status                                 "1"              UHanning AGN6K7KNI_VAL_MEAS_WINDOW_HANNING Rectangular AGN6K7KNI_VAL_MEAS_WINDOW_RECT    	           I    This function configures the trigger source for the acquisition system.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.    @    Selects the trigger source for the acquisition system.

Valid Values:
AGN6K7KNI_VAL_SOFTWARE_TRIG - Software Trigger, Selects a remote interface trigger command.
AGN6K7KNI_VAL_TRIG_CURRENT - Current Level, Selects an output current level.
AGN6K7KNI_VAL_TRIG_EXTERNAL - External, Selects all digital port pins that have been configured as trigger sources.
AGN6K7KNI_VAL_TRIG_EXPR<1-8> - Expression1 to Expression8, Selects a user-defined expression as the trigger source.
AGN6K7KNI_VAL_TRIG_PIN<1-7> -  PIN1 to PIN7, Selects a digital port pin configured as a trigger input.
AGN6K7KNI_VAL_TRIG_TRAN - Transient, Selects the transient system as the trigger source.
AGN6K7KNI_VAL_TRIG_VOLTAGE - Voltage Level, Selects an output voltage level.

Default Value:
AGN6K7KNI_VAL_SOFTWARE_TRIG

SCPI Command:
TRIGger:ACQuire:SOURce <source>    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   7-   D  �    Instrument Handle                7� -    �    Channel Name                     8� -� 0 �    Acquire Source                   ;�#���b  �    Status                                 "1"              �Software Trigger AGN6K7KNI_VAL_SOFTWARE_TRIG Current Level AGN6K7KNI_VAL_TRIG_CURRENT External AGN6K7KNI_VAL_TRIG_EXTERNAL Expression1 AGN6K7KNI_VAL_TRIG_EXPR1 Expression2 AGN6K7KNI_VAL_TRIG_EXPR2 Expression3 AGN6K7KNI_VAL_TRIG_EXPR3 Expression4 AGN6K7KNI_VAL_TRIG_EXPR4 Expression5 AGN6K7KNI_VAL_TRIG_EXPR5 Expression6 AGN6K7KNI_VAL_TRIG_EXPR6 Expression7 AGN6K7KNI_VAL_TRIG_EXPR7 Expression8 AGN6K7KNI_VAL_TRIG_EXPR8 PIN1 AGN6K7KNI_VAL_TRIG_PIN1 PIN2 AGN6K7KNI_VAL_TRIG_PIN2 PIN3 AGN6K7KNI_VAL_TRIG_PIN3 PIN4 AGN6K7KNI_VAL_TRIG_PIN4 PIN5 AGN6K7KNI_VAL_TRIG_PIN5 PIN6 AGN6K7KNI_VAL_TRIG_PIN6 PIN7 AGN6K7KNI_VAL_TRIG_PIN7 Transient AGN6K7KNI_VAL_TRIG_TRANSIENT Voltage Level AGN6K7KNI_VAL_TRIG_VOLTAGE    	           F    This function sets the triggered voltage for the acquisition system.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.    �    Sets the triggered voltage level of the output for the acquisition system.

Valid Range:
N6950A, N6970A, N7950A and N7970A: 0.009 to 9.18 V
N6951A, N6971A, N7951A and N7971A: 0.02 to 20.4 V
N6952A, N6972A, N7952A and N7972A: 0.04 to 40.8 V
N6953A, N6973A, N7953A and N7973A: 0.06 to 61.2 V
N6954A, N6974A, N7954A and N7974A: 0.08 to 81.6 V
N6976A, N7976A: 0.12 to 122.4 V
N6977A, N7977A: 0.16 to 163.2 V

Default Value:
N6950A, N6970A, N7950A and N7970A: 0.009 V
N6951A, N6971A, N7951A and N7971A: 0.02 V
N6952A, N6972A, N7952A and N7972A: 0.04 V
N6953A, N6973A, N7953A and N7973A: 0.06 V
N6954A, N6974A, N7954A and N7974A: 0.08 V
N6976A, N7976A: 0.12 V
N6977A, N7977A: 0.16 V

SCPI Command:
TRIGger:ACQuire:VOLTage[:LEVel] <value>|MIN|MAX    �    Sets the slope of the signal.  Applies when the measurement trigger source is set to a level.

Valid Values:
AGN6K7KNI_VAL_TRIG_ACQ_SLOPE_POS - Positive, specifies a rising slope of the output signal.
AGN6K7KNI_VAL_TRIG_ACQ_SLOPE_NEG - Negative, specifies a falling slope of the output signal.

Default Value:
AGN6K7KNI_VAL_TRIG_ACQ_SLOPE_POS

SCPI Command:
TRIGger:ACQuire:VOLTage:SLOPe POSitive|NEGative    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   E�-   D  �    Instrument Handle                F; -    �    Channel Name                     G1 - �   �    Level                            J -� 0 �    Slope                            K�#���b  �    Status                                 "1"    0.009               TPositive AGN6K7KNI_VAL_TRIG_ACQ_SLOPE_POS Negative AGN6K7KNI_VAL_TRIG_ACQ_SLOPE_NEG    	           F    This function sets the triggered current for the acquisition system.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.    �    Sets the triggered current level of the output for the acquisition system.

Valid Range:
-10.2% to 102% of rating without power dissipator, If current rating is 100%, then the valid range is: 
N6950A, N6970A, N7950A and N7970A: -10.2 to 102 A
N6951A, N6971A, N7951A and N7971A: -5.1 to 51 A
N6952A, N6972A, N7952A and N7972A: -2.55 to 25.5 A
N6953A, N6973A, N7953A, N7973A, N6976A and N7976A: -1.7 to 17 A
N6954A, N6974A, N7954A, N7974A, N6977A and N7977A: -1.275 to 12.75 A

up to -102% to 102% of rating with power dissipator, If current rating is 100%, then the valid range is: 
N6950A, N6970A, N7950A and N7970A: -102 to 102 A
N6951A, N6971A, N7951A and N7971A: -51 to 51 A
N6952A, N6972A, N7952A and N7972A: -25.5 to 25.5 A
N6953A, N6973A, N7953A, N7973A, N6976A and N7976A: -17 to 17 A
N6954A, N6974A, N7954A, N7974A, N6977A and N7977A: -12.75 to 12.75 A

Default Value:
N6950A, N6970A, N7950A and N7970A: 1.02 A
N6951A, N6971A, N7951A and N7971A: 0.51 A
N6952A, N6972A, N7952A and N7972A: 0.255 A
N6953A, N6973A, N7953A, N7973A, N6976A and N7976A: 0.17 A
N6954A, N6974A, N7954A, N7974A, N6977A and N7977A: 0.1275 A

SCPI Command:
TRIGger:ACQuire:CURRent[:LEVel] <value>|MIN|MAX    �    Sets the slope of the signal.  Applies when the measurement trigger source is set to a level.

Valid Values:
AGN6K7KNI_VAL_TRIG_ACQ_SLOPE_POS - Positive, specifies a rising slope of the output signal.
AGN6K7KNI_VAL_TRIG_ACQ_SLOPE_NEG - Negative, specifies a falling slope of the output signal.

Default Value:
AGN6K7KNI_VAL_TRIG_ACQ_SLOPE_POS

SCPI Command:
TRIGger:ACQuire:CURRent:SLOPe POSitive|NEGative    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   S=-   D  �    Instrument Handle                S� -    �    Channel Name                     T� - �   �    Level                            Y| -� 0 �    Slope                            [#���b  �    Status                                 "1"    1.02               TPositive AGN6K7KNI_VAL_TRIG_ACQ_SLOPE_POS Negative AGN6K7KNI_VAL_TRIG_ACQ_SLOPE_NEG    	           �    This function configures the output transient mode for the active priority mode.

Notes:
(1) Use agn6k7kni_ConfigureOutputPriorityMode function to configure the active priority mode.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.    6    Sets the transient mode. This determines what happens to the output voltage when the transient system is initiated and triggered.

Valid Values:
AGN6K7KNI_VAL_TRANSIENT_MODE_FIXED - Fixed, keeps the output voltage at its immediate value.
AGN6K7KNI_VAL_TRANSIENT_MODE_STEP - Step, steps the output to the triggered level when a trigger occurs.
AGN6K7KNI_VAL_TRANSIENT_MODE_LIST - List, causes the output to follow the list values when a trigger occurs.
AGN6K7KNI_VAL_TRANSIENT_MODE_ARB - Arbitrary Waveform, causes the output to follow the arbitrary waveform values when a trigger occurs.

Default Value:
AGN6K7KNI_VAL_TRANSIENT_MODE_FIXED

Notes:
(1) List and Arbitrary Waveform are only available for N7900 Series model.

SCPI Command:
[SOURce:]VOLTage:MODE FIXed|STEP|LIST|ARB
[SOURce:]CURRent:MODE FIXed|STEP|LIST|ARB    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   c-   D  �    Instrument Handle                c� -    �    Channel Name                     d� -� 0 �    Transient Mode                   g�#���b  �    Status                                 "1"               �Fixed AGN6K7KNI_VAL_TRANSIENT_MODE_FIXED Step AGN6K7KNI_VAL_TRANSIENT_MODE_STEP List AGN6K7KNI_VAL_TRANSIENT_MODE_LIST Arbitrary Waveform AGN6K7KNI_VAL_TRANSIENT_MODE_ARB    	           g    This function sets the triggered voltage level when the output is operating in voltage priority mode.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.        Sets the triggered voltage level when the output is operating in voltage priority mode.

Valid Range:
N6950A, N6970A, N7950A and N7970A: 0.009 to 9.18 V
N6951A, N6971A, N7951A and N7971A: 0.02 to 20.4 V
N6952A, N6972A, N7952A and N7972A: 0.04 to 40.8 V
N6953A, N6973A, N7953A and N7973A: 0.06 to 61.2 V
N6954A, N6974A, N7954A and N7974A: 0.08 to 81.6 V
N6976A, N7976A: 0.12 to 122.4 V
N6977A, N7977A: 0.16 to 163.2 V

Default Value:
N6950A, N6970A, N7950A and N7970A: 0.009 V
N6951A, N6971A, N7951A and N7971A: 0.02 V
N6952A, N6972A, N7952A and N7972A: 0.04 V
N6953A, N6973A, N7953A and N7973A: 0.06 V
N6954A, N6974A, N7954A and N7974A: 0.08 V
N6976A, N7976A: 0.12 V
N6977A, N7977A: 0.16 V

SCPI Command:
[SOURce:]VOLTage[:LEVel]:TRIGgered[:AMPLitude] <value>|MIN|MAX    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   o�-   D  �    Instrument Handle                p8 -    �    Channel Name                     q. -�   �    Level                            t7#���b  �    Status                                 "1"    0.009    	           g    This function sets the triggered current level when the output is operating in current priority mode.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.    �    Sets the triggered current level when the output is operating in current priority mode.

Valid Range:
-10.2% to 102% of rating without power dissipator, If current rating is 100%, then the valid range is: 
N6950A, N6970A, N7950A and N7970A: -10.2 to 102 A
N6951A, N6971A, N7951A and N7971A: -5.1 to 51 A
N6952A, N6972A, N7952A and N7972A: -2.55 to 25.5 A
N6953A, N6973A, N7953A, N7973A, N6976A and N7976A: -1.7 to 17 A
N6954A, N6974A, N7954A, N7974A, N6977A and N7977A: -1.275 to 12.75 A


up to -102% to 102% of rating with power dissipator, If current rating is 100%, then the valid range is: 
N6950A, N6970A, N7950A and N7970A: -102 to 102 A
N6951A, N6971A, N7951A and N7971A: -51 to 51 A
N6952A, N6972A, N7952A and N7972A: -25.5 to 25.5 A
N6953A, N6973A, N7953A, N7973A, N6976A and N7976A: -17 to 17 A
N6954A, N6974A, N7954A, N7974A, N6977A and N7977A: -12.75 to 12.75 A

Default Value:
N6950A, N6970A, N7950A and N7970A: 1.02 A
N6951A, N6971A, N7951A and N7971A: 0.51 A
N6952A, N6972A, N7952A and N7972A: 0.255 A
N6953A, N6973A, N7953A, N7973A, N6976A and N7976A: 0.17 A
N6954A, N6974A, N7954A, N7974A, N6977A and N7977A: 0.1275 A

SCPI Command:
[SOURce:]CURRent[:LEVel]:TRIGgered[:AMPLitude] <value>|MIN|MAX    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   {@-   D  �    Instrument Handle                {� -    �    Channel Name                     |� -�   �    Level                            ��#���b  �    Status                                 "1"    1.02    	           _    This function is used to comply with the IVI DC Power specification only.

SCPI Command:
None     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.     _    This control is used to comply with the IVI DC Power specification only.

Default Value:
None    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   ��-   D  �    Instrument Handle                �; -    �    Channel Name                     �1 -�   �    Limit                            ��#���b  �    Status                                 "1"    0    	           [    This function configures whether a trigger out is generated when a transient step occurs.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.     �    Specifies whether a trigger out is generated when a transient step occurs.

Valid Values:
VI_TRUE  - Enables trigger out.
VI_FALSE - Disables trigger out.

Default Value:
VI_FALSE

SCPI Command:
[SOURce:]STEP:TOUTput 0|OFF|1|ON    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   ��-   D  �    Instrument Handle                �0 -    �    Channel Name                     �& -� N  �    Trigger Out Enabled              �#���b  �    Status                                 "1"    True VI_TRUE False VI_FALSE    	           T    Configures the trigger source the APS waits for before changing the output signal.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.    �    Selects the trigger source for the transient system.

Valid Values:
AGN6K7KNI_VAL_SOFTWARE_TRIG - Software Trigger, Selects a remote interface trigger command.
AGN6K7KNI_VAL_TRIG_EXTERNAL - External, Selects ALL digital port pins that have been configured as trigger sources.
AGN6K7KNI_VAL_TRIG_IMMEDIATE - Immediate, Triggers the transient as soon as it is initiated.
AGN6K7KNI_VAL_TRIG_EXPR<1-8> - Expression1 to Expresstion8, Selects a user-defined expression as the trigger source.
AGN6K7KNI_VAL_TRIG_PIN<1-7> - PIN1 to PIN7, Selects a digital port pin configured as a trigger input.

Default Value: 
AGN6K7KNI_VAL_SOFTWARE_TRIG

SCPI Command:
TRIGger:TRANsient:SOURce <source>    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   �-   D  �    Instrument Handle                �� -    �    Channel Name                     �� -� 0 �    Source                           �g#���b  �    Status                                 "1"              lSoftware Trigger AGN6K7KNI_VAL_SOFTWARE_TRIG External AGN6K7KNI_VAL_TRIG_EXTERNAL Immediate AGN6K7KNI_VAL_TRIG_IMMEDIATE Expression1 AGN6K7KNI_VAL_TRIG_EXPR1 Expression2 AGN6K7KNI_VAL_TRIG_EXPR2 Expression3 AGN6K7KNI_VAL_TRIG_EXPR3 Expression4 AGN6K7KNI_VAL_TRIG_EXPR4 Expression5 AGN6K7KNI_VAL_TRIG_EXPR5 Expression6 AGN6K7KNI_VAL_TRIG_EXPR6 Expression7 AGN6K7KNI_VAL_TRIG_EXPR7 Expression8 AGN6K7KNI_VAL_TRIG_EXPR8 PIN1 AGN6K7KNI_VAL_TRIG_PIN1 PIN2 AGN6K7KNI_VAL_TRIG_PIN2 PIN3 AGN6K7KNI_VAL_TRIG_PIN3 PIN4 AGN6K7KNI_VAL_TRIG_PIN4 PIN5 AGN6K7KNI_VAL_TRIG_PIN5 PIN6 AGN6K7KNI_VAL_TRIG_PIN6 PIN7 AGN6K7KNI_VAL_TRIG_PIN7    	           o    This function configures the list transient of the APS.

Notes:
(1) This function supports N79XX models only.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.    R    Sets the list repeat count. This sets the number of times that a list is executed before it completes.

Defined Values:
AGN6K7KNI_VAL_LIST_COUNT_INFINITY (-1) - Infinity,  runs the list continuously.

Valid Values:
AGN6K7KNI_VAL_LIST_COUNT_INFINITY
1 to 4096

Default Value:
1

SCPI Command:
[SOURce:]LIST:COUNt <value>|MIN|MAX|INFinity        Specifies how the list responds to triggers.

Valid Values:
AGN6K7KNI_VAL_LIST_STEP_AUTO - Dwell Paced, causes the output to automatically advance to each step, after the receipt of an initial starting trigger. Steps are paced by the dwell list.
AGN6K7KNI_VAL_LIST_STEP_ONCE - Trigger Paced, causes the output to remain at the present step until a trigger advances it to the next step. Triggers that arrive during the dwell time are ignored.

Default Value:
AGN6K7KNI_VAL_LIST_STEP_AUTO

SCPI Command:
[SOURce:]LIST:STEP ONCE|AUTO    �    Determines the output value when the list terminates.

Valid Values:
VI_TRUE - ON, the output voltage or current remains at the last list step. The value of the last voltage or current list step becomes the IMMediate value when the list completes.
VI_FALSE - OFF, when the list is aborted, the output returns to the settings that were in effect before the list started.

Default Value:
VI_FALSE

SCPI Command:
[SOURce:]LIST:TERMinate:LAST 0|OFF|1|ON    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   ��-   D  �    Instrument Handle                �� -    �    Channel Name                     � - � 0  �    Repeat Count                     �� -� 0 �    Pace Type                        �� � P N  �    Terminate Last Enabled           ��#���b  �    Status                                 "1"    1               TDwell Paced AGN6K7KNI_VAL_LIST_STEP_AUTO Trigger Paced AGN6K7KNI_VAL_LIST_STEP_ONCE    True VI_TRUE False VI_FALSE    	          *    This function configures the voltage or current setting for each list step in volts.

Notes:
(1) This function supports N79XX models only.
(2) This function only apply in the presently active priority mode. Use agn6k7kni_ConfigureOutputPriorityMode function to configure the active priority mode.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.     �    Sets the number of elements in the ViReal64 array you specify for the voltage list parameter.

Valid Values:
1 to 512

Default Value:
1    �    Specifies the setting for each list step. Values are specified in volts or amperes.

Valid Range:
If the active priority mode is voltage priority:
N6950A, N6970A, N7950A and N7970A: 0.009 to 9.18 V
N6951A, N6971A, N7951A and N7971A: 0.02 to 20.4 V
N6952A, N6972A, N7952A and N7972A: 0.04 to 40.8 V
N6953A, N6973A, N7953A and N7973A: 0.06 to 61.2 V
N6954A, N6974A, N7954A and N7974A: 0.08 to 81.6 V
N6976A, N7976A: 0.12 to 122.4 V
N6977A, N7977A: 0.16 to 163.2 V

If the active priority mode is current priority:
-10.2% to 102% of rating without power dissipator, If current rating is 100%, then the valid range is: 
N6950A, N6970A, N7950A and N7970A: -10.2 to 102 A
N6951A, N6971A, N7951A and N7971A: -5.1 to 51 A
N6952A, N6972A, N7952A and N7972A: -2.55 to 25.5 A
N6953A, N6973A, N7953A, N7973A, N6976A and N7976A: -1.7 to 17 A
N6954A, N6974A, N7954A, N7974A, N6977A and N7977A: -1.275 to 12.75 A


up to -102% to 102% of rating with power dissipator, If current rating is 100%, then the valid range is: 
N6950A, N6970A, N7950A and N7970A: -102 to 102 A
N6951A, N6971A, N7951A and N7971A: -51 to 51 A
N6952A, N6972A, N7952A and N7972A: -25.5 to 25.5 A
N6953A, N6973A, N7953A, N7973A, N6976A and N7976A: -17 to 17 A
N6954A, N6974A, N7954A, N7974A, N6977A and N7977A: -12.75 to 12.75 A

Default Value:
0.009 V

SCPI Command:
[SOURce:]LIST:VOLTage[:LEVel] <value>,{<value>}
[SOURce:]LIST:CURRent[:LEVel] <value>{,<value>}    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   �t-   D  �    Instrument Handle                � -    �    Channel Name                     �	 - � 0  �    List Size                        �� -�   �    Level List                       �/#���b  �    Status                                 "1"    1    0.009    	           �    This function configures which list steps generate a trigger signal at the beginning of step (BOSTep) or end of step (EOSTep).     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.     �    Sets the number of elements in the ViReal64 array you specify for the voltage list parameter.

Valid Values:
1 to 512

Default Value:
1    n    Specifies which list steps generate a trigger signal at the beginning of step (BOSTep).

Valid Values:
VI_TRUE - Generate a trigger signal at the beginning of the specified step.
VI_FALSE - Do not generate a trigger signal at the beginning of the specified step.

Default Value:
VI_FALSE

SCPI Command:
[SOURce:]LIST:TOUTput:BOSTep[:DATA] 0|OFF|1|ON {,0|OFF|1|ON }    \    Specifies which list steps generate a trigger signal at the end of step (EOSTep).

Valid Values:
VI_TRUE - Generate a trigger signal at the end of the specified step.
VI_FALSE - Do not generate a trigger signal at the end of the specified step.

Default Value:
VI_FALSE

SCPI Command:
[SOURce:]LIST:TOUTput:EOSTep[:DATA] 0|OFF|1|ON {,0|OFF|1|ON }    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   ǋ-   D  �    Instrument Handle                �* -    �    Channel Name                     �  - � 0  �    List Size                        ɱ -� M  �    BOST List                        �' �  M  �    EOST List                        ̋#���b  �    Status                                 "1"    1    	VI_FALSE    	VI_FALSE    	           s    This function configures the dwell time for each list step.

Notes:
(1) This function supports N79XX models only.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.     �    Sets the number of elements in the ViReal64 array you specify for the voltage list parameter.

Valid Values:
1 to 512

Default Value:
1    �    Specifies the dwell time for each list step. Dwell time is the time that the output will remain at a specific step.

Valid Range:
Dwell times can be programmed from 0 through 262.144 seconds with the following resolution:
Range in seconds          Resolution
0 to 0.262144             1 microsecond
0.262144 to 2.62144       10 microseconds
2.62144 to 26.2144        100 microseconds
26.2144 to 262.144        1 millisecond

Default Value:
0.001

SCPI Command:
[SOURce:]LIST:DWELl <value>{,<value>}    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   �-   D  �    Instrument Handle                Խ -    �    Channel Name                     ճ - � 0  �    List Size                        �D -�   �    Dwell List                       �@#���b  �    Status                                 "1"    1    0.001    	          I    This function configures the arbitrary waveform settings.

Notes:
(1) This function supports N79XX models only.
(2) This function only apply in the presently active priority mode. Use agn6k7kni_ConfigureOutputPriorityMode function to configure the active priority mode.

SCPI Command:
[SOURce:]ARB:FUNCtion:TYPE CURRent|VOLTage     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.    5    Specifies the number of times the Arb repeats.

Defined Values:
AGN6K7KNI_VAL_ARB_COUNT_INFINITY (-1) - Infinity, repeat the Arb continuously.

Valid Values:
AGN6K7KNI_VAL_ARB_COUNT_INFINITY
1 to 256

Default Value:
AGN6K7KNI_VAL_ARB_COUNT_INFINITY

SCPI Command:
[SOURce:]ARB:COUNt <value>|MIN|MAX|INFinity    �    Selects the output setting after the Arb ends.

Valid Values:
VI_TRUE - ON, the output voltage or current remains at the last Arb value. The last Arb voltage or current value becomes the IMMediate value when the ARB completes.
VI_FALSE - OFF, the output returns to the settings that were in effect before the Arb started.

Default Value:
VI_FALSE

SCPI Command:
[SOURce:]ARB:TERMinate:LAST 0|OFF|1|ON    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   �e-   D  �    Instrument Handle                � -    �    Channel Name                     �� - � 0  �    Repeat Count                     �7 -� N  �    Terminate Last Enabled           ��#���b  �    Status                                 "1"    !AGN6K7KNI_VAL_ARB_COUNT_INFINITY    True 1 False 0    	          &    This function configures the voltage constant dwell arbitrary waveform settings.

Notes:
(1) This function supports N79XX models only.
(2) This function only apply in the presently active priority mode. Use agn6k7kni_ConfigureOutputPriorityMode function to configure the active priority mode.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.     �    Sets the number of elements in the ViReal64 array you specify for the constant dwell Level parameter.

Valid Range:
1 to 65535

Default Value:
1    p    Specifies the level of each point in the Arb.  Values are specified in volts or amperes.

Valid Range:
If the active priority mode is voltage priority:
N6950A, N6970A, N7950A and N7970A: 0.009 to 9.18 V
N6951A, N6971A, N7951A and N7971A: 0.02 to 20.4 V
N6952A, N6972A, N7952A and N7972A: 0.04 to 40.8 V
N6953A, N6973A, N7953A and N7973A: 0.06 to 61.2 V
N6954A, N6974A, N7954A and N7974A: 0.08 to 81.6 V
N6976A, N7976A: 0.12 to 122.4 V
N6977A, N7977A: 0.16 to 163.2 V

If the active priority mode is current priority:
-10.2% to 102% of rating without power dissipator, If current rating is 100%, then the valid range is: 
N6950A, N6970A, N7950A and N7970A: -10.2 to 102 A
N6951A, N6971A, N7951A and N7971A: -5.1 to 51 A
N6952A, N6972A, N7952A and N7972A: -2.55 to 25.5 A
N6953A, N6973A, N7953A, N7973A, N6976A and N7976A: -1.7 to 17 A
N6954A, N6974A, N7954A, N7974A, N6977A and N7977A: -1.275 to 12.75 A


up to -102% to 102% of rating with power dissipator, If current rating is 100%, then the valid range is: 
N6950A, N6970A, N7950A and N7970A: -102 to 102 A
N6951A, N6971A, N7951A and N7971A: -51 to 51 A
N6952A, N6972A, N7952A and N7972A: -25.5 to 25.5 A
N6953A, N6973A, N7953A, N7973A, N6976A and N7976A: -17 to 17 A
N6954A, N6974A, N7954A, N7974A, N6977A and N7977A: -12.75 to 12.75 A

Default Value:
0.009 V

SCPI Command:
[SOURce:]ARB:VOLTage:CDWell[:LEVel] <value>{,<value>}|<Block>    =    Specifies the dwell time of each point in the voltage Arb.

Valid Range:
0.00001024 to 0.30

Default Value:
0.001

Notes:
(1) Current and voltage Arbs share settings, so setting this parameter for a current Arb changes the voltage dwell value and vice versa.

SCPI Command:
[SOURce:]ARB:VOLTage:CDWell:DWELl <value>    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   ��-   D  �    Instrument Handle                � -    �    Channel Name                     � - � 0  �    Array Size                       �* -�   �    Level Array                      �� �    �    Constant Dwell Time              ��#���b  �    Status                                 "1"    1    0.009    0.001    	           |    This function configures the trigger source for arbitrary waveforms.

Notes:
(1) This function supports N79XX models only.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None    �    Selects the trigger source for arbitrary waveforms.

Valid Values:
AGN6K7KNI_VAL_SOFTWARE_TRIG - Software Trigger, Selects a remote interface trigger command.
AGN6K7KNI_VAL_TRIG_EXTERNAL - External, Selects all digital port pins that have been configured as trigger sources.
AGN6K7KNI_VAL_TRIG_IMMEDIATE - Immediate, Triggers the transient as soon as it is INITiated.
AGN6K7KNI_VAL_TRIG_EXPR<1-8> - Expression1 to Expression8, Selects a user-defined expression as the trigger source.
AGN6K7KNI_VAL_TRIG_PIN<1-7> -  PIN1 to PIN7, Selects a digital port pin configured as a trigger input.

Default Value:
AGN6K7KNI_VAL_SOFTWARE_TRIG

SCPI Command:
TRIGger:ARB:SOURce <source>    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   �}-   D  �    Instrument Handle                � - � 0 �    Arb Trigger Source                �#���b  �    Status                                           lSoftware Trigger AGN6K7KNI_VAL_SOFTWARE_TRIG External AGN6K7KNI_VAL_TRIG_EXTERNAL Immediate AGN6K7KNI_VAL_TRIG_IMMEDIATE Expression1 AGN6K7KNI_VAL_TRIG_EXPR1 Expression2 AGN6K7KNI_VAL_TRIG_EXPR2 Expression3 AGN6K7KNI_VAL_TRIG_EXPR3 Expression4 AGN6K7KNI_VAL_TRIG_EXPR4 Expression5 AGN6K7KNI_VAL_TRIG_EXPR5 Expression6 AGN6K7KNI_VAL_TRIG_EXPR6 Expression7 AGN6K7KNI_VAL_TRIG_EXPR7 Expression8 AGN6K7KNI_VAL_TRIG_EXPR8 PIN1 AGN6K7KNI_VAL_TRIG_PIN1 PIN2 AGN6K7KNI_VAL_TRIG_PIN2 PIN3 AGN6K7KNI_VAL_TRIG_PIN3 PIN4 AGN6K7KNI_VAL_TRIG_PIN4 PIN5 AGN6K7KNI_VAL_TRIG_PIN5 PIN6 AGN6K7KNI_VAL_TRIG_PIN6 PIN7 AGN6K7KNI_VAL_TRIG_PIN7    	           �    This function configures the Over-Voltage Protection. The over-voltage protection will turn the output off if the output voltage reaches the programmed over-voltage limit.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.     q    This control is used to comply with the IVI DCPwr specification.

Valid Values:
VI_TRUE

Default Value:
VI_TRUE    u    Sets the over-voltage protection level.  Units are in volts. If the output voltage exceeds the OVP level, the output is disabled and the Questionable Condition status register OV bit is set.

Valid Range:
0 to 120% of rating, If current rating is 100%, then the valid range is:
N6950A, N6970A, N7950A and N7970A: 0 to 10.8 V
N6951A, N6971A, N7951A and N7971A: 0 to 24 V
N6952A, N6972A, N7952A and N7972A: 0 to 48 V
N6953A, N6973A, N7953A and N7973A: 0 to 72 V
N6954A, N6974A, N7954A and N7974A: 0 to 96 V
N6976A, N6977A: 0 to 144V
N7976A, N7977A: 0 to 192V

Default Value:
N6950A, N6970A, N7950A and N7970A: 10.8 V
N6951A, N6971A, N7951A and N7971A: 24 V
N6952A, N6972A, N7952A and N7972A: 48 V
N6953A, N6973A, N7953A and N7973A: 72 V
N6954A, N6974A, N7954A and N7974A: 96 V
N6976A, N6977A: 144V
N7976A, N7977A: 192V

SCPI Command:
[SOURce:]VOLTage:PROTection[:LEVel] <value>|MIN|MAX    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   
L-   D  �    Instrument Handle                
� -    �    Channel Name                     � - N  �    OVP Enabled                      Z -�   �    Limit                            �#���b  �    Status                                 "1"   True VI_TRUE False VI_FALSE    10.8    	              This function configures the Over-Current Protection. When over-current protection is enabled, the power supply turns off the output if the output current reaches the current limit setting and transitions from constant voltage (CV) to current limit (CL+ or CL-) mode.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.     �    Enables or disables the over-current protection.

Valid Values:
VI_TRUE - Enables over-current protection
VI_FALSE - Disables over-current protection

Default Value:
VI_FALSE

SCPI Command:
[SOURce:]CURRent:PROTection:STATe 0|OFF|1|ON    Y    Sets the over-current protection delay. The over-current protection function will not be triggered during the delay time. After the delay time has expired, the over-current protection function will be active.

Valid Range:
0 to 0.255 seconds

Default Value:
0.020 seconds

SCPI Command:
[SOURce:]CURRent:PROTection:DELay[:TIME] <value>|MIN|MAX    �    Specifies what starts the over-current protection delay timer.

Valid Values:
AGN6K7KNI_VAL_OCP_DELAY_START_SCHANGE - Settings Change, starts the over-current delay whenever a command changes the output settings.
AGN6K7KNI_VAL_OCP_DELAY_START_CCTRANS - CC Transition, starts the over-current delay timer by any transition of the output into current limit mode.

Default Value:
AGN6K7KNI_VAL_OCP_DELAY_START_SCHANGE

SCPI Command:
[SOURce:]CURRent:PROTection:DELay:STARt SCHange|CCTRans    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   �-   D  �    Instrument Handle                x -    �    Channel Name                     n - N  �    OCP Enabled                      b -�   �    Delay                            � �  0 �    Delay Start Time                 �#���b  �    Status                                 "1"    True VI_TRUE False VI_FALSE    0.02               jSettings Change AGN6K7KNI_VAL_OCP_DELAY_START_SCHANGE CC Transition AGN6K7KNI_VAL_OCP_DELAY_START_CCTRANS    	           P    This function configures the operating mode of the remote inhibit digital pin.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None        Sets the operating mode of the remote inhibit digital pin. The inhibit function shuts down the output in response to an external signal on the Inhibit input pin. 

The Inhibit mode is stored in non-volatile memory. 

Valid Values:
AGN6K7KNI_VAL_DIGITAL_INHIBIT_MODE_LATCHING - Latching, allows a true signal on digital port PIN3 when configured as Inhibit In to disable output.
AGN6K7KNI_VAL_DIGITAL_INHIBIT_MODE_LIVE - Live, allows the output to follow the state of the Inhibit In pin. When Inhibit In is true, the output is disabled. When Inhibit In is false, the output is not affected.
AGN6K7KNI_VAL_DIGITAL_INHIBIT_MODE_OFF - The Inhibit input is ignored.

Default Value:
AGN6K7KNI_VAL_DIGITAL_INHIBIT_MODE_OFF

SCPI Command:
OUTPut:INHibit:MODE LATChing|LIVE|OFF    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   %�-   D  �    Instrument Handle                &D - � 0 �    Inhibit Mode                     )N#���b  �    Status                                           �Latching AGN6K7KNI_VAL_DIGITAL_INHIBIT_MODE_LATCHING Live AGN6K7KNI_VAL_DIGITAL_INHIBIT_MODE_LIVE Off AGN6K7KNI_VAL_DIGITAL_INHIBIT_MODE_OFF    	           .    This function configures the watchdog timer.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Enables or disables the I/O watchdog timer.

Valid Values:
VI_TRUE - Enables the I/O watchdog timer.
VI_FALSE - Disables the I/O watchdog timer.

Default Value:
VI_FALSE

SCPI Command:
OUTPut:PROTection:WDOG[:STATe] 0|OFF|1|ON    �    Sets the watchdog delay time.

Valid Values:
1 to 3600 seconds

Default Value:
60 seconds

Notes
(1) When the watchdog timer is enabled, the output is disabled if there is no SCPI I/O activity on any remote interface (USB, LAN, GPIB) within the delay time. 
(2) The watchdog timer function is NOT reset by activity on the front panel - the output will still shut down after the time period has elapsed. 

SCPI Command:
OUTPut:PROTection:WDOG:DELay <value>|MIN|MAX    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   0u-   D  �    Instrument Handle                1 - Q N  �    Watchdog Timer Enabled           2  -� 0  �    Delay                            3�#���b  �    Status                                 True VI_TRUE False VI_FALSE    60    	           B    This function configures the remote sense fault detection state.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None        Enables or disables remote sense fault detection. This condition is annunciated by the SF status bit.

Valid Values:
VI_TRUE - Enables remote sense fault detection.
VI_FALSE - Disables remote sense fault detection.

Default Value:
VI_TRUE

SCPI Command:
SENSe:FAULt:STATe 0|OFF|1|ON    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   :�-   D  �    Instrument Handle                ;q - N  �    Sense Fault Detection Enabled    <�#���b  �    Status                                True VI_TRUE False VI_FALSE    	           :    Configures the digital input and output port of the APS.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     _    Specifies the name of the pin to be configured.

Valid Values:
"1" to "7"

Default Value:
"1"    I    Sets the function of the pins. The functions are saved in non-volatile memory.

Valid Values:
AGN6K7KNI_VAL_DIGITAL_PIN_FUNC_DIO - Digital Input/Output, General-purpose ground-referenced digital input/output function.
AGN6K7KNI_VAL_DIGITAL_PIN_FUNC_DIN - Digital Input, Digital input-only mode.
AGN6K7KNI_VAL_DIGITAL_PIN_FUNC_EXPR<1-7> - Expression<1-7>, A user-defined expression drives the pin.
AGN6K7KNI_VAL_DIGITAL_PIN_FUNC_FAULT - Fault Output, Pin 1 functions as an isolated fault output. Pin 2 is common for pin 1
AGN6K7KNI_VAL_DIGITAL_PIN_FUNC_INHIBIT - Inhibit Input, Pin 3 functions as an inhibit input.
AGN6K7KNI_VAL_DIGITAL_PIN_FUNC_ON_COUPLE - On Couple, Pins 4 -7 synchronize the output On state.
AGN6K7KNI_VAL_DIGITAL_PIN_FUNC_OFF_COUPLE - Off Couple, Pins 4 -7 synchronize the output Off state.
AGN6K7KNI_VAL_DIGITAL_PIN_FUNC_TRIG_INPUT - Trigger Input, A trigger input function.
AGN6K7KNI_VAL_DIGITAL_PIN_FUNC_TRIG_OUTPUT - Trigger Output, A trigger output function.

Default Value:
AGN6K7KNI_VAL_DIGITAL_PIN_FUNC_DIN

SCPI Command:
[SOURce:]DIGital:PIN<1-7>:FUNCtion <function>    h    Sets the polarity of the pins.

Valid Values:
AGN6K7KNI_VAL_DIGITAL_PIN_POL_POS - Positive, a logical true signal is a voltage high at the pin.
AGN6K7KNI_VAL_DIGITAL_PIN_POL_NEG - Negative, a logical true signal is a voltage low at the pin.

Default Value:
AGN6K7KNI_VAL_DIGITAL_PIN_POL_POS

SCPI Command:
[SOURce:]DIGital:PIN<1-7>:POLarity POSitive|NEGative    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   CK-   D  �    Instrument Handle                C� -   �    Pin Name                         DQ - � 0 �    Pin Function                     H� -� 0 �    Pin Polarity                     J#���b  �    Status                                 "1"             2Digital Input/Output AGN6K7KNI_VAL_DIGITAL_PIN_FUNC_DIO Digital Input AGN6K7KNI_VAL_DIGITAL_PIN_FUNC_DIN Expression1 AGN6K7KNI_VAL_DIGITAL_PIN_FUNC_EXPR1 Expression2 AGN6K7KNI_VAL_DIGITAL_PIN_FUNC_EXPR2 Expression3 AGN6K7KNI_VAL_DIGITAL_PIN_FUNC_EXPR3 Expression4 AGN6K7KNI_VAL_DIGITAL_PIN_FUNC_EXPR4 Expression5 AGN6K7KNI_VAL_DIGITAL_PIN_FUNC_EXPR5 Expression6 AGN6K7KNI_VAL_DIGITAL_PIN_FUNC_EXPR6 Expression7 AGN6K7KNI_VAL_DIGITAL_PIN_FUNC_EXPR7 Expression8 AGN6K7KNI_VAL_DIGITAL_PIN_FUNC_EXPR8 Fault Output AGN6K7KNI_VAL_DIGITAL_PIN_FUNC_FAULT Inhibit Input AGN6K7KNI_VAL_DIGITAL_PIN_FUNC_INHIBIT On Couple AGN6K7KNI_VAL_DIGITAL_PIN_FUNC_ON_COUPLE Off Couple AGN6K7KNI_VAL_DIGITAL_PIN_FUNC_OFF_COUPLE Trigger Input AGN6K7KNI_VAL_DIGITAL_PIN_FUNC_TRIG_INPUT Trigger Output AGN6K7KNI_VAL_DIGITAL_PIN_FUNC_TRIG_OUTPUT               VPositive AGN6K7KNI_VAL_DIGITAL_PIN_POL_POS Negative AGN6K7KNI_VAL_DIGITAL_PIN_POL_NEG    	           G    This function configures the BUS triggers state on digital port pins.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None    �    Enables or disables BUS triggers on digital port pins. 

This allows a BUS trigger to be sent to any digital port pin that has been configured as a trigger output. A trigger out pulse is generated when the state is on and a bus trigger is received. 

Valid Values:
VI_TRUE - Enables BUS triggers on digital port pins.
VI_FALSE - Disables BUS triggers on digital port pins.

Default Value:
VI_FALSE

SCPI Command:
[SOURce:]DIGital:TOUTput:BUS[:ENABle] 0|OFF|1|ON    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   T�-   D  �    Instrument Handle                Ul -
 N  �    Bus Trigger Enabled              WC#���b  �    Status                                 True VI_TRUE False VI_FALSE    	           <    This function reads the state of the digital control port.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Returns the binary-weighted value of the state of pins 1 through 7 in bits 0 through 6 respectively.

SCPI Command:
[SOURce:]DIGital:INPut:DATA?    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   ]�-   D  �    Instrument Handle                ^� - � 0  �    Input Data                       _4#���b  �    Status                                 	            	           <    This function write the state of the digital control port.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None    >    Sets the state of the digital control port. This only affects the pins whose function has been set to Digital IO operation.

The port has seven signal pins and a digital ground pin. In the binary-weighted value that is written to the port, the pins are controlled according to the following bit assignments: 

Pin               1     2     3     4     5     6     7
Bit number        0     1     2     3     4     5     6
Decimal value     1     2     4     8     16    32    64

Valid Values:
0 to 127

Default Value:
0

SCPI Command:
[SOURce:]DIGital:OUTPut:DATA <value>    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   e�-   D  �    Instrument Handle                fx - � 0  �    Output Data                      h�#���b  �    Status                                 0    	           o    This function defines signal expressions.

SCPI Command:
SYSTem:SIGNal:DEFine EXPRession<1-8>, <"expression">     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     X    Specifies the expression number to be defined.

Valid Values:
1 to 8

Default Value:
1    H    Specifies the signal expression enclosed in quotes ("").

Valid Values:
Expressions are case-insensitive. You can enter alpha characters as all caps , all lowercase, or mixed case. Spaces must be included on either side of the Boolean operators And, Or , and Not. Spaces are not required around parentheses.

Default Value:
""    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   o�-   D  �    Instrument Handle                p. -  0  �    Expression Number                p� -�   �    Expression                       q�#���b  �    Status                                 1    ""    	           ;    This function configures the output on/off couple source.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None    �    Sets the on-couple signal source to an expression.

Valid Values:
AGN6K7KNI_VAL_EXPRESSION_SOURCE_NONE - None
AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR1 - Expression1
AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR2 - Expression2
AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR3 - Expression3
AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR4 - Expression4
AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR5 - Expression5
AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR6 - Expression6
AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR7 - Expression7
AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR8 - Expression8

Default Value:
AGN6K7KNI_VAL_EXPRESSION_SOURCE_NONE

SCPI Command:
OUTPut[:STATe]:COUPle:ON:SOURce EXPRession <1-8>    �    Sets the off-couple signal source to an expression.

Valid Values:
AGN6K7KNI_VAL_EXPRESSION_SOURCE_NONE - None
AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR1 - Expression1
AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR2 - Expression2
AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR3 - Expression3
AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR4 - Expression4
AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR5 - Expression5
AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR6 - Expression6
AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR7 - Expression7
AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR8 - Expression8

Default Value:
AGN6K7KNI_VAL_EXPRESSION_SOURCE_NONE

SCPI Command:
OUTPut[:STATe]:COUPle:OFF:SOURce EXPRession <1-8>    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   x�-   D  �    Instrument Handle                yU -  0 �    On Couple Source                 {� -� 0 �    Off Couple Source                ~o#���b  �    Status                                         	  �None AGN6K7KNI_VAL_EXPRESSION_SOURCE_NONE Expression1 AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR1 Expression2 AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR2 Expression3 AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR3 Expression4 AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR4 Expression5 AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR5 Expression6 AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR6 Expression7 AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR7 Expression8 AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR8            	  �None AGN6K7KNI_VAL_EXPRESSION_SOURCE_NONE Expression1 AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR1 Expression2 AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR2 Expression3 AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR3 Expression4 AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR4 Expression5 AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR5 Expression6 AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR6 Expression7 AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR7 Expression8 AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR8    	           B    This function configures the User-defined protection of the APS.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Enables or disables the user-defined protection.

Valid Values:
VI_TRUE - Enables the user-defined protection.
VI_FALSE - Disables the user-defined protection.

Default Value:
VI_FALSE

SCPI Command:
OUTPut:PROTection:USER[:STATe] 0|OFF|1|ON    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12    �    Sets the user-defined protection source to an expression. When an expression is specified, the output is disabled if the expression is true.

Valid Values:
AGN6K7KNI_VAL_EXPRESSION_SOURCE_NONE - None
AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR<1-8> - Expression<1-8>

Default Values:
AGN6K7KNI_VAL_USER_PROTECTION_SOURCE_NONE

SCPI Command:
OUTPut:PROTection:USER:SOURce EXPRession<1-8>|NONE   ��-   D  �    Instrument Handle                �t - P N  �    User Protection Enabled          �o#���b  �    Status                           � -� 0 �    Source                                 True VI_TRUE False VI_FALSE    	                   	  �None AGN6K7KNI_VAL_EXPRESSION_SOURCE_NONE Expression1 AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR1 Expression2 AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR2 Expression3 AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR3 Expression4 AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR4 Expression5 AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR5 Expression6 AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR6 Expression7 AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR7 Expression8 AGN6K7KNI_VAL_EXPRESSION_SOURCE_EXPR8    �    This function configures the threshold comparators of the APS.

The APS models have four built-in level comparators that can generate an output signal based on the comparison of two input signals.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.    <    Specifies the threshold comparator number.

Valid Values:
AGN6K7KNI_VAL_THRESHOLD_COMPARATOR_1 - Comparator1
AGN6K7KNI_VAL_THRESHOLD_COMPARATOR_2 - Comparator2
AGN6K7KNI_VAL_THRESHOLD_COMPARATOR_3 - Comparator3
AGN6K7KNI_VAL_THRESHOLD_COMPARATOR_4 - Comparator4

Default Value:
AGN6K7KNI_VAL_THRESHOLD_COMPARATOR_1    a    Sets the sensing function for comparators THR1, THR2, THR3 or THR4.

Valid Values:
AGN6K7KNI_VAL_THRESHOLD_FUNC_AHOUR - Ampere-hour, selects the amp-hour function.
AGN6K7KNI_VAL_THRESHOLD_FUNC_CURRENT - Current, selects the current function.
AGN6K7KNI_VAL_THRESHOLD_FUNC_POWER - Power, selects the power function.
AGN6K7KNI_VAL_THRESHOLD_FUNC_VOLTAGE - Voltage, selects the voltage function.
AGN6K7KNI_VAL_THRESHOLD_FUNC_WHOUR - Watt-hour, selects the watt-hour function.

Default Value:
AGN6K7KNI_VAL_THRESHOLD_FUNC_VOLTAGE

SCPI Command:
SENSe:THReshold<1|2|3|4>:FUNCtion AHOur|CURRent|POWer|VOLTage|WHOur    �    Sets the operation type for comparator 1,2,3 or 4.

Valid Values:
AGN6K7KNI_VAL_THRESHOLD_OPERATION_GT - Greater Than, specifies that the signal will be true if the measurement is greater than the threshold level.
AGN6K7KNI_VAL_THRESHOLD_OPERATION_LT - Less Than, specifies that the signal will be true if the measurements less than the threshold level.

Default Value:
AGN6K7KNI_VAL_THRESHOLD_OPERATION_GT

SCPI Command:
SENSe:THReshold<1|2|3|4>:OPERation GT|LT    �    Selects the threshold level for comparators 1,2,3 or 4 for the specified threshold function.

Valid Range:
Threshold Function          Range
Ampere-hour                 0 to +2.251165E+10
Current                     0 to +6.248237E+01
Power                       0 to +3.130377E+03
Voltage                     0 to +5.008797E+01
Watt-hour                   0 to +1.127837E+12

Default Value:
0

SCPI Command:
SENSe:THReshold<1|2|3|4>:AHOur[:LEVel] <value>|MIN|MAX
SENSe:THReshold<1|2|3|4>:CURRent[:LEVel] <value>|MIN|MAX
SENSe:THReshold<1|2|3|4>:POWer[:LEVel] <value>|MIN|MAX
SENSe:THReshold<1|2|3|4>:VOLTage[:LEVel] <value>|MIN|MAX
SENSe:THReshold<1|2|3|4>:WHOur[:LEVel] <value>|MIN|MAX    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   �9-   D  �    Instrument Handle                �� -    �    Channel Name                     �� - � 0 �    Comparator Number                � -� 0 �    Function                         �{ �  0 �    Operation                        �S � �   �    Level                            �#���b  �    Status                                 "1"               �Comparator1 AGN6K7KNI_VAL_THRESHOLD_COMPARATOR_1 Comparator2 AGN6K7KNI_VAL_THRESHOLD_COMPARATOR_2 Comparator3 AGN6K7KNI_VAL_THRESHOLD_COMPARATOR_3 Comparator4 AGN6K7KNI_VAL_THRESHOLD_COMPARATOR_4              �Ampere-hour AGN6K7KNI_VAL_THRESHOLD_FUNC_AHOUR Current AGN6K7KNI_VAL_THRESHOLD_FUNC_CURRENT Power AGN6K7KNI_VAL_THRESHOLD_FUNC_POWER Voltage AGN6K7KNI_VAL_THRESHOLD_FUNC_VOLTAGE Watt-hour AGN6K7KNI_VAL_THRESHOLD_FUNC_WHOUR               aGreater Than AGN6K7KNI_VAL_THRESHOLD_OPERATION_GT Less Than AGN6K7KNI_VAL_THRESHOLD_OPERATION_LT    0    	           �    This function configures the external data logging (Elog) function of the APS.

Notes:
(1) This function supports N79XX models only.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.        Selects the external datalog measurement function.

Valid Values:
AGN6K7KNI_VAL_ELOG_MEAS_FUNC_VOLTAGE - Voltage, voltage measurement function.
AGN6K7KNI_VAL_ELOG_MEAS_FUNC_CURRENT - Current, current measurement function.

Default Value:
AGN6K7KNI_VAL_ELOG_MEAS_FUNC_VOLTAGE    d    Enables or disables the Elog for specified current or voltage measurement function.

Valid Values:
VI_TRUE - Enables the Elog current or voltage measurement function.
VI_FALSE - Disables the Elog current or voltage measurement function.

Default Value:
VI_FALSE

SCPI Command:
SENSe:ELOG:FUNCtion:CURRent 0|OFF|1|ON
SENSe:ELOG:FUNCtion:VOLTage 0|OFF|1|ON        Enables or disables logging of the minimum and maximum current or voltage values.

Valid Values:
VI_TRUE - Enables logging.
VI_FALSE - Disables logging.

Default Value:
VI_FALSE

SCPI Command:
SENSe:ELOG:FUNCtion:CURRent:MINMax 0|OFF|1|ON
SENSe:ELOG:FUNCtion:VOLTage:MINMax 0|OFF|1|ON    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   � -   D  �    Instrument Handle                �� -    �    Channel Name                     �� - � 0 �    Function                         �� -� N  �    Datalog Enabled                  � � P N  �    Min Max Enabled                  �C#���b  �    Status                                 "1"               ZVoltage AGN6K7KNI_VAL_ELOG_MEAS_FUNC_VOLTAGE Current AGN6K7KNI_VAL_ELOG_MEAS_FUNC_CURRENT    True VI_TRUE False VI_FALSE    True VI_TRUE False VI_FALSE    	           �    This function configures the measurement parameters for external datalog function.

Notes:
(1) This function supports N79XX models only.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.     �    Sets the integration time of an Elog measurement.

Valid Range:
0.0001024 to 60

Default Value:
60

SCPI Command:
SENSe:ELOG:PERiod <value>|MIN|MAX    P    Selects the Elog current measurement range.  

Units are in amperes.  

Defined Values:
AGN6K7KNI_VAL_ELOG_CURRENT_RANGE_AUTO(-1000) - Seamless measurement autoranging.

Valid Range:
N6950A, N6970A, N7950A and N7970A: -450 to 450 A
N6951A, N6971A, N7951A and N7971A: -225 to 225 A
N6952A, N6972A, N7952A and N7972A: -112.5 to 112.5 A
N6953A, N6973A, N7953A and N7973A: -74.9 to 74.9 A
N6954A, N6974A, N7954A and N7974A: -56.2 to 56.2 A
N6976A and N7976A: -37.6 to 37.6 A
N6977A and N7977A: -28.1 to 28.1 A

Default Value:
AGN6K7KNI_VAL_ELOG_CURRENT_RANGE_AUTO

Notes:
(1) The value that you enter must be the highest value that you expect to measure. The instrument selects the range with the best resolution for the value entered.

SCPI Command:
SENSe:ELOG:CURRent[:DC]:RANGe[:UPPer] <value>|MIN|MAX
SENSe:ELOG:CURRent[:DC]:RANGe:AUTO 0|OFF|1|ON    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   �w-   D  �    Instrument Handle                � -    �    Channel Name                     � - �   �    Integration Time                 �� -�   �    Range                            �#���b  �    Status                                 "1"    60    &AGN6K7KNI_VAL_ELOG_CURRENT_RANGE_AUTO    	           ;    This function configures the calibration mode of the APS.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None    �    Select the calibration mode.

Valid Values:
AGN6K7KNI_VAL_CAL_MODE_VOLTAGE - Voltage Level       
AGN6K7KNI_VAL_CAL_MODE_CMRR - Voltage Common Mode Rejection Ratio
AGN6K7KNI_VAL_CAL_MODE_TC - Temperature Coefficient           
AGN6K7KNI_VAL_CAL_MODE_CURRENT_HIGH_RANGE - High Current Range 
AGN6K7KNI_VAL_CAL_MODE_CURRENT_LOW_RANGE - Low Current Range  
AGN6K7KNI_VAL_CAL_MODE_CURRENT_SHARING - Current Sharing
AGN6K7KNI_VAL_CAL_MODE_BOTTOM_OUT_RES - Bottom Out Resistance

Default Value:
AGN6K7KNI_VAL_CAL_MODE_VOLTAGE

SCPI Command:
CALibrate:VOLTage[:LEVel] <value>
CALibrate:VOLTage:CMRR
CALibrate:CURRent:TC
CALibrate:CURRent[:LEVel] <value>
CALibrate:CURRent:MEASure <value>
CALibrate:CURRent:SHARing
CALibrate:RESistance:BOUT     �    Selects the range to calibrate for the specified calibration mode.

Default Value:
20

Notes:
(1) This parameter only affects Voltage Level, High Current Level and Low Current Level calibration mode.

    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   �9-   D  �    Instrument Handle                �� -  0 �    Mode                             ƾ -�   �    Level                            Ǒ#���b  �    Status                                           �Voltage Level AGN6K7KNI_VAL_CAL_MODE_VOLTAGE Voltage Common Mode Rejection Ratio AGN6K7KNI_VAL_CAL_MODE_CMRR Temperature Coefficient AGN6K7KNI_VAL_CAL_MODE_TC High Range Current AGN6K7KNI_VAL_CAL_MODE_CURRENT_HIGH_RANGE Low Range Current AGN6K7KNI_VAL_CAL_MODE_CURRENT_LOW_RANGE Current Sharing AGN6K7KNI_VAL_CAL_MODE_CURRENT_SHARING Bottom Out Resistance AGN6K7KNI_VAL_CAL_MODE_BOTTOM_OUT_RES    20    	           L    This function selects the calibration level and sets the calibration data.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None        Advances to the next level in the calibration.

Valid Values:
AGN6K7KNI_VAL_CAL_LEVEL_P1 - P1, first level
AGN6K7KNI_VAL_CAL_LEVEL_P2 - P2, second level
AGN6K7KNI_VAL_CAL_LEVEL_P3 - P3, third level

Default Value:
AGN6K7KNI_VAL_CAL_LEVEL_P1

SCPI Command:
CALibrate:LEVel P1|P2|P3        Enters the calibration value read by the external meter. You must first select a calibration level for the value being entered. Data values are expressed in base units - either volts or amperes, depending on which function is being calibrated.

Default Value: 
None    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   �-   D  �    Instrument Handle                Э -  0 �    Calibration Level                �� -�   �    Calibration Data                 ��#���b  �    Status                                            ZP1 AGN6K7KNI_VAL_CAL_LEVEL_P1 P2 AGN6K7KNI_VAL_CAL_LEVEL_P2 P3 AGN6K7KNI_VAL_CAL_LEVEL_P3        	           5    This function enables or disables calibration mode.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Enables or disables calibration mode.

Valid Values:
VI_TRUE - Enables calibration mode.
VI_FALSE - Disables calibration mode.

Default Value:
VI_FALSE

SCPI Command:
CALibrate:STATe 0|OFF|1|ON [,<password>]     �    Specifies the calibration password. Password is required if it has been set to a non-zero value.

Valid Values:
Numeric string up to 15 digits characters.

Default Value:
"0"    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   �-   D  �    Instrument Handle                ڵ - P N  �    Calibration Enabled              ێ -�   �    Password                         �F#���b  �    Status                                 True VI_TRUE False VI_FALSE    "0"    	          �    This function sets the value of a ViInt32 attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the agn6k7kni_init or agn6k7kni_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the agn6k7kni_error_message function.  To obtain additional information about the error condition, call the agn6k7kni_GetError function.  To clear the error information from the driver, call the agn6k7kni_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
None 

ERRORS:
None 
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviDCPwr Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviDCPwr Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    C    Pass the ID of an attribute.

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
  to the right of the attribute names in the list box. 
  Attributes with data types other than ViInt32 are dim.  If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
     �    If the attribute is channel-based, this parameter specifies the name of the channel on which to set the value of the attribute. If the attribute is not channel-based, then pass VI_NULL or an empty string.

Valid Channel Names:  1

Default Value:  ""
   ��-   D  �    Instrument Handle                �#���b  �    Status                           � � � 0  �    Attribute Value                 ���� � ���                                          �: = � � �    Attribute ID                     �� =    �    Channel Name                           	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViReal64 attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the agn6k7kni_init or agn6k7kni_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the agn6k7kni_error_message function.  To obtain additional information about the error condition, call the agn6k7kni_GetError function.  To clear the error information from the driver, call the agn6k7kni_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
None 

ERRORS:
None 
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviDCPwr Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviDCPwr Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    B    Pass the ID of an attribute.

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
  Attributes with data types other than ViReal64 are dim.  If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
     �    If the attribute is channel-based, this parameter specifies the name of the channel on which to set the value of the attribute. If the attribute is not channel-based, then pass VI_NULL or an empty string.

Valid Channel Names:  1

Default Value:  ""
   ��-   D  �    Instrument Handle                ��#���b  �    Status                           N � �   �    Attribute Value                 ���� � ���                                          i = � � �    Attribute ID                     � =    �    Channel Name                           	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViString attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the agn6k7kni_init or agn6k7kni_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the agn6k7kni_error_message function.  To obtain additional information about the error condition, call the agn6k7kni_GetError function.  To clear the error information from the driver, call the agn6k7kni_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
None 

ERRORS:
None  
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviDCPwr Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviDCPwr Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    A    Pass the ID of an attribute.

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
  Attributes with data types other than ViString are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
     �    If the attribute is channel-based, this parameter specifies the name of the channel on which to set the value of the attribute. If the attribute is not channel-based, then pass VI_NULL or an empty string.

Valid Channel Names:  1

Default Value:  ""
   &-   D  �    Instrument Handle                �#���b  �    Status                           } � �   �    Attribute Value                 ���� � ���                                          � = � � �    Attribute ID                     "� =    �    Channel Name                           	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViBoolean attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the agn6k7kni_init or agn6k7kni_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the agn6k7kni_error_message function.  To obtain additional information about the error condition, call the agn6k7kni_GetError function.  To clear the error information from the driver, call the agn6k7kni_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
None 

ERRORS:
None 
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviDCPwr Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviDCPwr Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    C    Pass the ID of an attribute.

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
  Attributes with data types other than ViBoolean are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
     �    If the attribute is channel-based, this parameter specifies the name of the channel on which to set the value of the attribute. If the attribute is not channel-based, then pass VI_NULL or an empty string.

Valid Channel Names:  1

Default Value:  ""
   *U-   D  �    Instrument Handle                +#���b  �    Status                           1� � � N  �    Attribute Value                 ���� � ���                                          3� = � � �    Attribute ID                     9 =    �    Channel Name                           	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViSession attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the agn6k7kni_init or agn6k7kni_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the agn6k7kni_error_message function.  To obtain additional information about the error condition, call the agn6k7kni_GetError function.  To clear the error information from the driver, call the agn6k7kni_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
None 

ERRORS:
None 
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviDCPwr Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviDCPwr Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none     �    If the attribute is channel-based, this parameter specifies the name of the channel on which to set the value of the attribute. If the attribute is not channel-based, then pass VI_NULL or an empty string.

Valid Channel Names:  1

Default Value:  ""
    C    Pass the ID of an attribute.

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
  Attributes with data types other than ViSession are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   @�-   D  �    Instrument Handle                AA#���b  �    Status                           G� � � D  �    Attribute Value                  I� =    �    Channel Name                     J� = � � �    Attribute ID                    ���� � ���                                                	               ""                0    .Press <ENTER> for a list of 
value constants.   �    This function queries the value of a ViInt32 attribute.

You can use this function to get the values of instrument- specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the agn6k7kni_init or agn6k7kni_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the agn6k7kni_error_message function.  To obtain additional information about the error condition, call the agn6k7kni_GetError function.  To clear the error information from the driver, call the agn6k7kni_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
None 

ERRORS:
None 
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviDCPwr Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviDCPwr Errors
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
     �    If the attribute is channel-based, this parameter specifies the name of the channel on which to obtain the value of the attribute. If the attribute is not channel-based, then pass VI_NULL or an empty string.

Valid Channel Names:  1

Default Value:  ""
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
  to the right of the attribute names in the list box.  
  Attributes with data types other than ViInt32 are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   S�-   D  �    Instrument Handle                TY#���b  �    Status                           Z� � � 0  �    Attribute Value                  \� =    �    Channel Name                     ]� = � � �    Attribute ID                           	           	            ""                0   �    This function queries the value of a ViReal64 attribute.

You can use this function to get the values of instrument- specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the agn6k7kni_init or agn6k7kni_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the agn6k7kni_error_message function.  To obtain additional information about the error condition, call the agn6k7kni_GetError function.  To clear the error information from the driver, call the agn6k7kni_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
None 

ERRORS:
None 
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviDCPwr Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviDCPwr Errors
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
     �    If the attribute is channel-based, this parameter specifies the name of the channel on which to obtain the value of the attribute. If the attribute is not channel-based, then pass VI_NULL or an empty string.

Valid Channel Names:  1

Default Value:  ""
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
  Attributes with data types other than ViReal64 are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   eS-   D  �    Instrument Handle                f#���b  �    Status                           l� � �   �    Attribute Value                  nh =    �    Channel Name                     oo = � � �    Attribute ID                           	           	           ""                0   4    This function queries the value of a ViString attribute.

You can use this function to get the values of instrument- specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

You must provide a ViChar array to serve as a buffer for the value.  You pass the number of bytes in the buffer as the Buffer Size parameter.  If the current value of the attribute, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you want to call this function just to get the required buffer size, you can pass 0 for the Buffer Size and VI_NULL for the Attribute Value buffer.  

If you want the function to fill in the buffer regardless of the   number of bytes in the value, pass a negative number for the Buffer Size parameter.  


     �    The ViSession handle that you obtain from the agn6k7kni_init or agn6k7kni_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    Q    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the return buffer, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the agn6k7kni_error_message function.  To obtain additional information about the error condition, call the agn6k7kni_GetError function.  To clear the error information from the driver, call the agn6k7kni_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
None 

ERRORS:
None  
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviDCPwr Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviDCPwr Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

    &    The buffer in which the function returns the current value of the attribute.  The buffer must be of type ViChar and have at least as many bytes as indicated in the Buffer Size parameter.

If the current value of the attribute, including the terminating NUL byte, contains more bytes that you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you specify 0 for the Buffer Size parameter, you can pass VI_NULL for this parameter.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>.  
     �    If the attribute is channel-based, this parameter specifies the name of the channel on which to obtain the value of the attribute. If the attribute is not channel-based, then pass VI_NULL or an empty string.

Valid Channel Names:  1

Default Value:  ""
    �    Pass the number of bytes in the ViChar array you specify for the Attribute Value parameter.  

If the current value of the attribute, including the terminating NUL byte, contains more bytes that you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

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
  Attributes with data types other than ViString are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   z�-   D  �    Instrument Handle                {E#���b  �    Status or Required Size          �� � L  �    Attribute Value                  �� =    �    Channel Name                     �� =� 0  �    Buffer Size                      �� = � � �    Attribute ID                           	           	            ""    512                0   �    This function queries the value of a ViBoolean attribute.

You can use this function to get the values of instrument- specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the agn6k7kni_init or agn6k7kni_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the agn6k7kni_error_message function.  To obtain additional information about the error condition, call the agn6k7kni_GetError function.  To clear the error information from the driver, call the agn6k7kni_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
None 

ERRORS:
None  
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviDCPwr Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviDCPwr Errors
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
     �    If the attribute is channel-based, this parameter specifies the name of the channel on which to obtain the value of the attribute. If the attribute is not channel-based, then pass VI_NULL or an empty string.

Valid Channel Names:  1

Default Value:  ""
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
  Attributes with data types other than ViBoolean are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   ��-   D  �    Instrument Handle                �^#���b  �    Status                           �� � � N  �    Attribute Value                  �� =    �    Channel Name                     �� = � � �    Attribute ID                           	           	            ""                0   �    This function queries the value of a ViSession attribute.

You can use this function to get the values of instrument- specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the agn6k7kni_init or agn6k7kni_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the agn6k7kni_error_message function.  To obtain additional information about the error condition, call the agn6k7kni_GetError function.  To clear the error information from the driver, call the agn6k7kni_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
None 

ERRORS:
None 
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviDCPwr Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviDCPwr Errors
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
     �    If the attribute is channel-based, this parameter specifies the name of the channel on which to obtain the value of the attribute. If the attribute is not channel-based, then pass VI_NULL or an empty string.

Valid Channel Names:  1

Default Value:  ""
    �    Pass the ID of an attribute.

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
  Attributes with data types other than ViSession are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   �_-   D  �    Instrument Handle                �#���b  �    Status                           �� � � D  �    Attribute Value                  �u =    �    Channel Name                     �| = � � �    Attribute ID                           	           	            ""                0    S    This function checks the validity of a value you specify for a ViInt32 attribute.     �    The ViSession handle that you obtain from the agn6k7kni_init or agn6k7kni_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the agn6k7kni_error_message function.  To obtain additional information about the error condition, call the agn6k7kni_GetError function.  To clear the error information from the driver, call the agn6k7kni_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
None 

ERRORS:
None  
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviDCPwr Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviDCPwr Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

    (    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none     �    If the attribute is channel-based, this parameter specifies the name of the channel on which to check the attribute value. If the attribute is not channel-based, then pass VI_NULL or an empty string.

Valid Channel Names:  1

Default Value:  ""
    @    Pass the ID of an attribute.

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
  to the right of the attribute names in the list box. 
  Attributes with data types other than ViInt32 are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   ��-   D  �    Instrument Handle                �s#���b  �    Status                           � � � 0  �    Attribute Value                  �> =    �    Channel Name                    ���� � ���                                          �= = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    T    This function checks the validity of a value you specify for a ViReal64 attribute.     �    The ViSession handle that you obtain from the agn6k7kni_init or agn6k7kni_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the agn6k7kni_error_message function.  To obtain additional information about the error condition, call the agn6k7kni_GetError function.  To clear the error information from the driver, call the agn6k7kni_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
None 

ERRORS:
None 
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviDCPwr Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviDCPwr Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

    (    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none     �    If the attribute is channel-based, this parameter specifies the name of the channel on which to check the attribute value. If the attribute is not channel-based, then pass VI_NULL or an empty string.

Valid Channel Names:  1

Default Value:  ""
    B    Pass the ID of an attribute.

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
  Attributes with data types other than ViReal64 are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   �|-   D  �    Instrument Handle                �8#���b  �    Status                           �� � �   �    Attribute Value                  � =    �    Channel Name                    ���� � ���                                          � = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    T    This function checks the validity of a value you specify for a ViString attribute.     �    The ViSession handle that you obtain from the agn6k7kni_init or agn6k7kni_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the agn6k7kni_error_message function.  To obtain additional information about the error condition, call the agn6k7kni_GetError function.  To clear the error information from the driver, call the agn6k7kni_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
None 

ERRORS:
None 
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviDCPwr Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviDCPwr Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

    (    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none     �    If the attribute is channel-based, this parameter specifies the name of the channel on which to check the attribute value. If the attribute is not channel-based, then pass VI_NULL or an empty string.

Valid Channel Names:  1

Default Value:  ""
    B    Pass the ID of an attribute.

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
  Attributes with data types other than ViString are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   �B-   D  �    Instrument Handle                ��#���b  �    Status                           �� � �   �    Attribute Value                  �� =    �    Channel Name                    ���� � ���                                          �� = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    U    This function checks the validity of a value you specify for a ViBoolean attribute.     �    The ViSession handle that you obtain from the agn6k7kni_init or agn6k7kni_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the agn6k7kni_error_message function.  To obtain additional information about the error condition, call the agn6k7kni_GetError function.  To clear the error information from the driver, call the agn6k7kni_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
None 

ERRORS:
None 
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviDCPwr Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviDCPwr Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

    (    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none     �    If the attribute is channel-based, this parameter specifies the name of the channel on which to check the attribute value. If the attribute is not channel-based, then pass VI_NULL or an empty string.

Valid Channel Names:  1

Default Value:  ""
    D    Pass the ID of an attribute.

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
  Attributes with data types other than ViBoolean are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   �	-   D  �    Instrument Handle                ��#���b  �    Status                           �_ � � N  �    Attribute Value                  � =    �    Channel Name                    ���� � ���                                          �� = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    U    This function checks the validity of a value you specify for a ViSession attribute.     �    The ViSession handle that you obtain from the agn6k7kni_init or agn6k7kni_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the agn6k7kni_error_message function.  To obtain additional information about the error condition, call the agn6k7kni_GetError function.  To clear the error information from the driver, call the agn6k7kni_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
None 

ERRORS:
None 
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviDCPwr Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviDCPwr Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

    (    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none     �    If the attribute is channel-based, this parameter specifies the name of the channel on which to check the attribute value. If the attribute is not channel-based, then pass VI_NULL or an empty string.

Valid Channel Names:  1

Default Value:  ""
    D    Pass the ID of an attribute.

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
  Attributes with data types other than ViSession are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   ��-   D  �    Instrument Handle                ��#���b  �    Status                           ( � � D  �    Attribute Value                  X =    �    Channel Name                    ���� � ���                                          W = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    �    This function initiates the transient trigger system.

SCPI Command:
INITiate[:IMMediate]:TRANsient

Notes:
(1) It takes a few milliseconds for the instrument to be ready to receive a trigger signal after receiving the INITiate command.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   4-   D  �    Instrument Handle                �#���b  �    Status                                 	          @    This function cancels any triggered actions. It also resets the WTG-tran and TRAN-active bits in the Operation Status registers. 

Notes:
(1) This function does not turn off continuous triggers. In this case, the trigger system will automatically re-initiate.

SCPI Command:
ABORt:TRANsient
STATus:OPERation:CONDition?     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   ;-   D  �    Instrument Handle                �#���b  �    Status                                 	           �    Generates an immediate transient trigger. This overrides any selected trigger source.

SCPI Command:
TRIGger:TRANsient[:IMMediate]     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   �-   D  �    Instrument Handle                %#���b  �    Status                                 	           �    This function returns the maximum programmable current limit that the APS accepts for a particular voltage level on a channel for the output range to which the power supply is currently configured.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.    �    Passes the voltage level for which to determine the maximum programmable current limit.  

Valid Range:
N6950A, N6970A, N7950A and N7970A: 0.009 to 9.18 V
N6951A, N6971A, N7951A and N7971A: 0.02 to 20.4 V
N6952A, N6972A, N7952A and N7972A: 0.04 to 40.8 V
N6953A, N6973A, N7953A and N7973A: 0.06 to 61.2 V
N6954A, N6974A, N7954A and N7974A: 0.08 to 81.6 V
N6976A, N7976A: 0.12 to 122.4 V
N6977A, N7977A: 0.16 to 163.2 V

Default Value:
N6950A, N6970A, N7950A and N7970A: 0.009 V
N6951A, N6971A, N7951A and N7971A: 0.02 V
N6952A, N6972A, N7952A and N7972A: 0.04 V
N6953A, N6973A, N7953A and N7973A: 0.06 V
N6954A, N6974A, N7954A and N7974A: 0.08 V
N6976A, N7976A: 0.12 V
N6977A, N7977A: 0.16 V     �    This parameter returns the maximum programmable current limit for the voltage level you specify.

Units: amperes

Remote commands:
[SOURce:]CURRent[:LEVel][:IMMediate][:AMPLitude]?[MIN|MAX]    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   &-   D  �    Instrument Handle                &� -    �    Channel Name                     '� - �   �    Voltage Level                    *f -�   �    Max Current Limit                +-#���b  �    Status                                 "1"    0.009    	            	          �    This function returns whether the power supply is in a particular output state.

A constant voltage condition occurs when the output voltage is equal to the value of the AGN6K7KNI_ATTR_VOLTAGE_LEVEL attribute and the current is less than or equal to the value of the AGN6K7KNI_ATTR_CURRENT_LIMIT attribute.

A constant current condition occurs when the output current is equal to the value of the AGN6K7KNI_ATTR_CURRENT_LIMIT attribute.

An unregulated condition occurs when the output voltage is less than the value of the AGN6K7KNI_ATTR_VOLTAGE_LEVEL attribute and the current is less than the value of the AGN6K7KNI_ATTR_CURRENT_LIMIT attribute.

An over-voltage condition occurs when the output voltage is equal to or greater than the value of the AGN6K7KNI_ATTR_OVP_LIMIT attribute and the AGN6K7KNI_ATTR_OVP_ENABLED attribute is set to VI_TRUE.

An over-current condition occurs when the output current is equal to or greater than the value of the AGN6K7KNI_ATTR_CURRENT_LIMIT attribute.  

When either an over-voltage condition or an over-current condition occurs, the power supply's output protection disables the output.  If the power supply is in an over-voltage or over-current state, it does not produce power until the output protection is reset.  The agn6k7kni_ResetOutputProtection function resets the output protection.  Once the output protection is reset, the power supply resumes generating a power signal.
     �    The ViSession handle that you obtain from the agn6k7kni_init or agn6k7kni_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    a    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the agn6k7kni_error_message function.  To obtain additional information about the error condition, call the agn6k7kni_GetError function.  To clear the error information from the driver, call the agn6k7kni_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
WARNINGS:
None 

ERRORS:
None  
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviDCPwr Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviDCPwr Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.    �    Passes the output state for which you want to query.

Valid Values:
AGN6K7KNI_VAL_OUTPUT_CONSTANT_VOLTAGE - Constant Voltage State
AGN6K7KNI_VAL_OUTPUT_CONSTANT_CURRENT - Constant Current State
AGN6K7KNI_VAL_OUTPUT_UNREGULATED - Unregulated State
AGN6K7KNI_VAL_OUTPUT_OVER_VOLTAGE - Over-voltage State
AGN6K7KNI_VAL_OUTPUT_OVER_VOLTAGE_NEGATIVE - Negative Over-voltage State
AGN6K7KNI_VAL_OUTPUT_OVER_CURRENT - Over-current State
AGN6K7KNI_VAL_OUTPUT_OVER_POWER - Over-power limit state
AGN6K7KNI_VAL_OUTPUT_OVER_POWER_NEGATIVE - Negative Over-power limit state
AGN6K7KNI_VAL_OUTPUT_OVER_TEMPERATURE - Over-Temperature state

Default Value:
AGN6K7KNI_VAL_OUTPUT_CONSTANT_VOLTAGE
     �    This parameter returns VI_TRUE if the power supply is currently in the state you specify with the outputState parameter, and VI_FALSE if it is not.

SCPI Command:
STATus:OPERation:CONDition?
STATus:QUEStionable<1|2>:CONDition?
   7�-   D  �    Instrument Handle                8`#���b  �    Status                           >� 3 
   �    Channel Name                     ?� 3 � 0 �    Output State                     Bp 3� N  �    In State                               	           "1"            	  �Constant Voltage AGN6K7KNI_VAL_OUTPUT_CONSTANT_VOLTAGE Constant Current AGN6K7KNI_VAL_OUTPUT_CONSTANT_CURRENT Unregulated AGN6K7KNI_VAL_OUTPUT_UNREGULATED Over Voltage AGN6K7KNI_VAL_OUTPUT_OVER_VOLTAGE Negative Over Voltage  AGN6K7KNI_VAL_OUTPUT_OVER_VOLTAGE_NEGATIVE Over Current AGN6K7KNI_VAL_OUTPUT_OVER_CURRENT Over Power AGN6K7KNI_VAL_OUTPUT_OVER_POWER Negative Over Power  AGN6K7KNI_VAL_OUTPUT_OVER_POWER_NEGATIVE Over Temperature AGN6K7KNI_VAL_OUTPUT_OVER_TEMPERATURE    	            �    This function returns the maximum programmable voltage level that the APS accepts for a particular current limit on a channel for the output range to which the power supply is currently configured.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.    r    Passes the current limit for which to determine the maximum programmable voltage level. 

Valid Range:
-10.2% to 102% of rating without power dissipator, If current rating is 100%, then the valid range is: 
N6950A, N6970A, N7950A and N7970A: -10.2 to 102 A
N6951A, N6971A, N7951A and N7971A: -5.1 to 51 A
N6952A, N6972A, N7952A and N7972A: -2.55 to 25.5 A
N6953A, N6973A, N7953A, N7973A, N6956A and N7956A: -1.7 to 17 A
N6954A, N6974A, N7954A, N7974A, N6957A and N7957A: -1.275 to 12.75 A


up to -102% to 102% of rating with power dissipator, If current rating is 100%, then the valid range is: 
N6950A, N6970A, N7950A and N7970A: -102 to 102 A
N6951A, N6971A, N7951A and N7971A: -51 to 51 A
N6952A, N6972A, N7952A and N7972A: -25.5 to 25.5 A
N6953A, N6973A, N7953A, N7973A, N6956A and N7956A: -17 to 17 A
N6954A, N6974A, N7954A, N7974A, N6957A and N7957A: -12.75 to 12.75 A

Default Value:
N6950A, N6970A, N7950A and N7970A: 1.02 A
N6951A, N6971A, N7951A and N7971A: 0.51 A
N6952A, N6972A, N7952A and N7972A: 0.255 A
N6953A, N6973A, N7953A, N7973A, N6956A and N7956A: 0.17 A
N6954A, N6974A, N7954A, N7974A, N6957A and N7957A: 0.1275 A     �    Returns the maximum programmable voltage level for the current limit you specify.

Units: volts

Remote commands:
[SOURce:]VOLTage[:LEVel][:IMMediate][:AMPLitude]? [MIN|MAX]    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   GB-   D  �    Instrument Handle                G� -    �    Channel Name                     H� - �   �    Current Limit                    MQ -�   �    Max Voltage Level                N#���b  �    Status                                 "1"    1.02    	            	           ;    This function query the delay offset of the slowest unit.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     a    Returns the delay offset of the slowest unit.

SCPI Command:
OUTPut[:STATe]:COUPle:MAX:DOFFset?    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   U%-   D  �    Instrument Handle                U� - �   �    Max Delay Offset                 V-#���b  �    Status                                 	            	           I    This function queries the number of times the unit has been calibrated.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12     �    Returns the number of times the unit has been calibrated. The count is incremented whenever the calibration (and date) is saved, the administration password is changed or reset, or the firmware is updated.

SCPI Command:
CALibrate:COUNt?   \�-   D  �    Instrument Handle                ]~#���b  �    Status                           c$ - � 0  �    Calibration Count                      	           	            e    Clear the protection function and restore normal operation.

SCPI Commands:
OUTPut:PROTection:CLEar     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   eC-   D  �    Instrument Handle                e� - �   �    Channel Name                     f�#���b  �    Status                                 "1"    	           x    This function resets the amp-hour or watt-hour measurement to zero.

SCPI Command:
SENSe:AHOur:RESet
SENSe:WHOur:RESet     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12     �    Specifies the measurement type to reset.

Valid Values:
AGN6K7KNI_VAL_MEAS_TYPE_AHO - Amp-hour
AGN6K7KNI_VAL_MEAS_TYPE_WHO - Watt-hour

Default Value:
AGN6K7KNI_VAL_MEAS_TYPE_AHO     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.   m�-   D  �    Instrument Handle                nS#���b  �    Status                           s� -� 0 �    Measurement Type                 t� -    �    Channel Name                           	                      KAmp-hour AGN6K7KNI_VAL_MEAS_TYPE_AHO Watt-hour AGN6K7KNI_VAL_MEAS_TYPE_WHO    "1"   ~    This function initiates a measurement acquisition.  After you call this function, the APS leaves the Idle state and acquires a measurements for each channel you specify.


Notes:
(1) This function does not check the instrument status. Typically, you call this function only in a sequence of calls to other low-level driver functions.  The sequence performs one operation.  You use the low-level functions to optimize one or more aspects of interaction with the instrument.  If you want to check the instrument status, call the agn6k7kni_error_query function at the conclusion of the sequence.

SCPI Command:
INITiate[:IMMediate]:ACQuire     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   yv - �   �    Channel Name                     zl-   D  �    Instrument Handle                {#���b  �    Status                             "1"        	           �    This function cancels any triggered measurements. It also resets the WTG-tran and TRAN-active bits in the Operation Status registers. 

SCPI Command:
ABORt:ACQuire     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   � - �   �    Channel Name                     �
-   D  �    Instrument Handle                ��#���b  �    Status                             "1"        	           [    This function triggers the acquisition system.

SCPI Command:
TRIGger:ACQuire[:IMMediate]     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.   �h-   D  �    Instrument Handle                �#���b  �    Status                           �� - �   �    Channel Name                           	           "1"    P    This function queries whether the measurement system is waiting for a trigger.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12     �    Returns the WTG_meas bit of the Operation Status Group. This bit indicates that whether the measurement system is waiting for a trigger.

SCPI Command:
STATus:OPERation:CONDation?     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.   ��-   D  �    Instrument Handle                �P#���b  �    Status                           �� -� N  �    WTG State                        �� -    �    Channel Name                           	           	            "1"    �    This function initiates the external data logging. 

Notes:
(1) It takes a few milliseconds for the instrument to be ready to receive a trigger signal after receiving the INITiate command.

SCPI Command:
INITiate[:IMMediate]:ELOG     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.   ��-   D  �    Instrument Handle                �.#���b  �    Status                           �� - �   �    Channel Name                           	           "1"   K    This function stops external data logging. It also resets the WTG-tran and TRAN-active bits in the Operation Status registers. 

Notes:
(1) This function supports N79XX models only.
(2) This function does not turn off continuous triggers. In this case, the trigger system will automatically re-initiate.

SCPI Command:
ABORt:ELOG     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.   ��-   D  �    Instrument Handle                �r#���b  �    Status                           � - �   �    Channel Name                           	           "1"    ]    This function triggers the external datalog system.

SCPI Command:
TRIGger:ELOG[:IMMediate]     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.   �)-   D  �    Instrument Handle                ��#���b  �    Status                           �n - �   �    Channel Name                           	           "1"    �    This function fetches the most recent external datalog records.

Notes:
(1) This function supports N79XX models only.

SCPI Command:
FETCh:ELOG? <maxrecords>     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.    &    Sets the maximum length of time in which to allow the read measurement operation to complete. Unit is milliseconds.  

Valid Range:
-1 to 4294967295 ms

Defined Values:
AGN6K7KNI_VAL_MAX_TIME_INFINITE (-1)             
AGN6K7KNI_VAL_MAX_TIME_IMMEDIATE (0)          

Default Value: 
5000 (ms)     �    Sets the maximum number of records of datalog data that the controller will return.

Valid Values:
1 to 16384

Default Value: 
1     1    Returns the external datalog measurement array.     X    Indicates the number of points the function places in the Measurement Array parameter.    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   ��-   D  �    Instrument Handle                �` -    �    Channel Name                     �V - � 0  �    Maximum Time                     �� -� 0  �    Maximum Records                  � �    �    Measurement Array                �G � � 0  �    Actual Records                   ��#���b  �    Status                                 "1"    5000    1    	            	            	          �    This function fetches measured value.

SCPI Command:
FETCh[:SCALar]:CURRent[:DC]?
FETCh[:SCALar]:CURRent:ACDC?
FETCh[:SCALar]:CURRent:HIGH?
FETCh[:SCALar]:CURRent:LOW?
FETCh[:SCALar]:CURRent:MAXimum?
FETCh[:SCALar]:CURRent:MINimum?
FETCh[:SCALar]:VOLTage[:DC]?
FETCh[:SCALar]:VOLTage:ACDC?
FETCh[:SCALar]:VOLTage:HIGH?
FETCh[:SCALar]:VOLTage:LOW?
FETCh[:SCALar]:VOLTage:MAXimum?
FETCh[:SCALar]:VOLTage:MINimum?
FETCh[:SCALar]:POWer[:DC]?
FETCh:AHOur?
FETCh:WHOur?     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.    &    Sets the maximum length of time in which to allow the read measurement operation to complete. Unit is milliseconds.  

Valid Range:
-1 to 4294967295 ms

Defined Values:
AGN6K7KNI_VAL_MAX_TIME_INFINITE (-1)             
AGN6K7KNI_VAL_MAX_TIME_IMMEDIATE (0)          

Default Value: 
5000 (ms)    �    Specifies the measurement type.

Valid Values:
AGN6K7KNI_VAL_MEAS_TYPE_CURRENT_DC - Average Current (DC)
AGN6K7KNI_VAL_MEAS_TYPE_CURRENT_RMS - RMS Current (AC + DC)
AGN6K7KNI_VAL_MEAS_TYPE_CURRENT_HIGH - High Level Of Current Pulse
AGN6K7KNI_VAL_MEAS_TYPE_CURRENT_LOW - Low Level Of Current Pulse
AGN6K7KNI_VAL_MEAS_TYPE_CURRENT_MAX - Maximum Current
AGN6K7KNI_VAL_MEAS_TYPE_CURRENT_MIN - Minimum Current
AGN6K7KNI_VAL_MEAS_TYPE_VOLTAGE_DC - Average Voltage (DC)
AGN6K7KNI_VAL_MEAS_TYPE_VOLTAGE_RMS - RMS Voltage (AC + DC)
AGN6K7KNI_VAL_MEAS_TYPE_VOLTAGE_HIGH - High Level Of Voltage Pulse
AGN6K7KNI_VAL_MEAS_TYPE_VOLTAGE_LOW - Low Level Of Voltage Pulse
AGN6K7KNI_VAL_MEAS_TYPE_VOLTAGE_MAX - Maximum Voltage
AGN6K7KNI_VAL_MEAS_TYPE_VOLTAGE_MIN - Minimum Voltage
AGN6K7KNI_VAL_MEAS_TYPE_POWER_DC - Average Power
AGN6K7KNI_VAL_MEAS_TYPE_AHO - Amp-hour
AGN6K7KNI_VAL_MEAS_TYPE_WHO - Watt-hour

Default Value:
AGN6K7KNI_VAL_MEAS_TYPE_VOLTAGE_DC     @    Returns the measured value for the specified measurement type.    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   ��-   D  �    Instrument Handle                �t -    �    Channel Name                     �j - � 0  �    Maximum Time                     Ƙ -� 0 �    Measurement Type                 �O �    �    Measurement                      ʗ#���b  �    Status                                 "1"    5000             Average Current AGN6K7KNI_VAL_MEAS_TYPE_CURRENT_DC RMS Current AGN6K7KNI_VAL_MEAS_TYPE_CURRENT_RMS Maximum Voltage AGN6K7KNI_VAL_MEAS_TYPE_VOLTAGE_MAX Minimum Voltage AGN6K7KNI_VAL_MEAS_TYPE_VOLTAGE_MIN Average Power AGN6K7KNI_VAL_MEAS_TYPE_POWER_DC Amp-hour AGN6K7KNI_VAL_MEAS_TYPE_AHO Watt-hour AGN6K7KNI_VAL_MEAS_TYPE_WHO High Level Of Current Pulse AGN6K7KNI_VAL_MEAS_TYPE_CURRENT_HIGH Low Level Of Current Pulse AGN6K7KNI_VAL_MEAS_TYPE_CURRENT_LOW Maximum Current AGN6K7KNI_VAL_MEAS_TYPE_CURRENT_MAX Minimum Current AGN6K7KNI_VAL_MEAS_TYPE_CURRENT_MIN Average Voltage AGN6K7KNI_VAL_MEAS_TYPE_VOLTAGE_DC RMS Voltage AGN6K7KNI_VAL_MEAS_TYPE_VOLTAGE_RMS High Level Of Voltage Pulse AGN6K7KNI_VAL_MEAS_TYPE_VOLTAGE_HIGH Low Level Of Voltage Pulse AGN6K7KNI_VAL_MEAS_TYPE_VOLTAGE_LOW    	            	              This function fetches the instantaneous measurement.

Notes:
(1) This function supports N79XX models only.

SCPI Command:
FETCh:ARRay:CURRent[:DC]? [<start_index>, <points>]
FETCh:ARRay:VOLTage[:DC]? [<start_index>, <points>]
FETCh:ARRay:POWer[:DC]? [<start_index>, <points>]     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.    &    Sets the maximum length of time in which to allow the read measurement operation to complete. Unit is milliseconds.  

Valid Range:
-1 to 4294967295 ms

Defined Values:
AGN6K7KNI_VAL_MAX_TIME_INFINITE (-1)             
AGN6K7KNI_VAL_MAX_TIME_IMMEDIATE (0)          

Default Value: 
5000 (ms)     �    Specifies the measurement type.

Valid Values:
AGN6K7KNI_VAL_MEAS_TYPE_CURRENT_DC - Average Current
AGN6K7KNI_VAL_MEAS_TYPE_VOLTAGE_DC - Average Voltage
AGN6K7KNI_VAL_MEAS_TYPE_POWER_DC - Average Power

Default Value:
AGN6K7KNI_VAL_MEAS_TYPE_VOLTAGE_DC     v    Specifies a subset starting at Start Index. This parameter is optional.

Valid Values:
1 to 524288

Default Value:
0     r    Specifies a subset of length points. This parameter is optional.

Valid Values:
1 to 524288

Default Value:
3255     s    Sets the number of elements in the Measurement Array parameter.

Valid Values:
1 to 1000000

Default Value: 
3255          Returns the measurement array.     X    Indicates the number of points the function places in the Measurement Array parameter.    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   ��-   D  �    Instrument Handle                ց -    �    Channel Name                     �w - � 0  �    Maximum Time                     إ -� 0 �    Measurement Type                 ٫ �  0  �    Start Index                      �) � � 0  �    Length                           ڣ �� 0  �    Array Size                       � �    �    Measurement Array                �F � � 0  �    Actual Points                    ۦ#���b  �    Status                                 "1"    5000              �Average Current AGN6K7KNI_VAL_MEAS_TYPE_CURRENT_DC Average Voltage AGN6K7KNI_VAL_MEAS_TYPE_VOLTAGE_DC Average Power AGN6K7KNI_VAL_MEAS_TYPE_POWER_DC    0    3255    3255    	            	            	              This function takes a measurement on the output signal and returns the measured value.

SCPI Command:
MEASure[:SCALar]:CURRent[:DC]?
MEASure[:SCALar]:CURRent:ACDC?
MEASure[:SCALar]:CURRent:HIGH?
MEASure[:SCALar]:CURRent:LOW?
MEASure[:SCALar]:CURRent:MAXimum?
MEASure[:SCALar]:CURRent:MINimum?
MEASure[:SCALar]:VOLTage[:DC]?
MEASure[:SCALar]:VOLTage:ACDC?
MEASure[:SCALar]:VOLTage:HIGH?
MEASure[:SCALar]:VOLTage:LOW?
MEASure[:SCALar]:VOLTage:MAXimum?
MEASure[:SCALar]:VOLTage:MINimum?
MEASure[:SCALar]:POWer[:DC]?     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.    `    Specifies the measurement type.

Valid Values:
AGN6K7KNI_VAL_MEAS_TYPE_CURRENT_DC - Average Current (DC)
AGN6K7KNI_VAL_MEAS_TYPE_CURRENT_RMS - RMS Current (AC + DC)
AGN6K7KNI_VAL_MEAS_TYPE_CURRENT_HIGH - High Level Of Current Pulse
AGN6K7KNI_VAL_MEAS_TYPE_CURRENT_LOW - Low Level Of Current Pulse
AGN6K7KNI_VAL_MEAS_TYPE_CURRENT_MAX - Maximum Current
AGN6K7KNI_VAL_MEAS_TYPE_CURRENT_MIN - Minimum Current
AGN6K7KNI_VAL_MEAS_TYPE_VOLTAGE_DC - Average Voltage (DC)
AGN6K7KNI_VAL_MEAS_TYPE_VOLTAGE_RMS - RMS Voltage (AC + DC)
AGN6K7KNI_VAL_MEAS_TYPE_VOLTAGE_HIGH - High Level Of Voltage Pulse
AGN6K7KNI_VAL_MEAS_TYPE_VOLTAGE_LOW - Low Level Of Voltage Pulse
AGN6K7KNI_VAL_MEAS_TYPE_VOLTAGE_MAX - Maximum Voltage
AGN6K7KNI_VAL_MEAS_TYPE_VOLTAGE_MIN - Minimum Voltage
AGN6K7KNI_VAL_MEAS_TYPE_POWER_DC - Average Power

Default Value:
AGN6K7KNI_VAL_MEAS_TYPE_VOLTAGE_DC     @    Returns the measured value for the specified measurement type.    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   �X-   D  �    Instrument Handle                �� -    �    Channel Name                     �� - � 0 �    Measurement Type                 �U -�   �    Measurement                      �#���b  �    Status                                 "1"             �Average Current AGN6K7KNI_VAL_MEAS_TYPE_CURRENT_DC RMS Current AGN6K7KNI_VAL_MEAS_TYPE_CURRENT_RMS High Level Of Current Pulse AGN6K7KNI_VAL_MEAS_TYPE_CURRENT_HIGH Low Level Of Current Pulse AGN6K7KNI_VAL_MEAS_TYPE_CURRENT_LOW Maximum Current AGN6K7KNI_VAL_MEAS_TYPE_CURRENT_MAX Minimum Current AGN6K7KNI_VAL_MEAS_TYPE_CURRENT_MIN Average Voltage AGN6K7KNI_VAL_MEAS_TYPE_VOLTAGE_DC RMS Voltage AGN6K7KNI_VAL_MEAS_TYPE_VOLTAGE_RMS High Level Of Voltage Pulse AGN6K7KNI_VAL_MEAS_TYPE_VOLTAGE_HIGH Low Level Of Voltage Pulse AGN6K7KNI_VAL_MEAS_TYPE_VOLTAGE_LOW Maximum Voltage AGN6K7KNI_VAL_MEAS_TYPE_VOLTAGE_MAX Minimum Voltage AGN6K7KNI_VAL_MEAS_TYPE_VOLTAGE_MIN Average Power AGN6K7KNI_VAL_MEAS_TYPE_POWER_DC    	            	          H    This function takes a measurement on the output signal and fetches the instantaneous measurement.

Notes:
(1) This function supports N79XX models only.

SCPI Command:
MEASure:ARRay:CURRent[:DC]? [<start_index>, <points>]
MEASure:ARRay:VOLTage[:DC]? [<start_index>, <points>]
MEASure:ARRay:POWer[:DC]? [<start_index>, <points>]     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Sets the name of the channel to configure.

Valid Values:
"1"

Default Value:
"1"

Notes:
(1) Since the APS models are single channel units, the APS models will accepts the channel Name "1" only for code compatibility and extendability.     �    Specifies the measurement type.

Valid Values:
AGN6K7KNI_VAL_MEAS_TYPE_CURRENT_DC - Average Current
AGN6K7KNI_VAL_MEAS_TYPE_VOLTAGE_DC - Average Voltage
AGN6K7KNI_VAL_MEAS_TYPE_POWER_DC - Average Power

Default Value:
AGN6K7KNI_VAL_MEAS_TYPE_VOLTAGE_DC     v    Specifies a subset starting at Start Index. This parameter is optional.

Valid Values:
1 to 524288

Default Value:
0     r    Specifies a subset of length points. This parameter is optional.

Valid Values:
1 to 524288

Default Value:
3255     s    Sets the number of elements in the Measurement Array parameter.

Valid Values:
1 to 1000000

Default Value: 
3255          Returns the measurement array.     X    Indicates the number of points the function places in the Measurement Array parameter.    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   ��-   D  �    Instrument Handle                �2 -    �    Channel Name                     �( - � 0 �    Measurement Type                 �. -� 0  �    Start Index                      �� �  0  �    Length                           �& � � 0  �    Array Size                       �� ��   �    Measurement Array                �� �  0  �    Actual Points                    �)#���b  �    Status                                 "1"              �Average Current AGN6K7KNI_VAL_MEAS_TYPE_CURRENT_DC Average Voltage AGN6K7KNI_VAL_MEAS_TYPE_VOLTAGE_DC Average Power AGN6K7KNI_VAL_MEAS_TYPE_POWER_DC    0    3255    3255    	            	            	           h    This function returns the ambient temperature measured at the air inlet on the right side of the unit.     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     M    Returns the ambient temperature.

SCPI Command:
SYSTem:TEMPerature:AMBient?     [    Returns the over-temperature margin.

SCPI Command:
OUTPut:PROTection:TEMPerature:MARGin?    �    This control contains the status code returned by the function call.

Status Codes:

Status    Description
-------------------------------------------------
0  No error (the call was successful).

3FFC0101  ID Query not supported - VI_WARN_NSUP_ID_QUERY
3FFC0102  Reset not supported - VI_WARN_NSUP_RESET
3FFC0103  Self Test not supported - VI_WARN_NSUP_SELF_TEST
3FFC0104  Error Query not supported - VI_WARN_NSUP_ERROR_QUERY
3FFC0105  Revision Query not supported - VI_WARN_NSUP_REV_QUERY
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFC0001  Parameter 1 out of range. (String not range checked)
BFFC0002  Parameter 2 (ID Query) out of range.
BFFC0003  Parameter 3 (Reset Device) out of range.
BFFC0004  Parameter 4 out of range.
BFFC0005  Parameter 5 out of range.
BFFC0006  Parameter 6 out of range.
BFFC0007  Parameter 7 out of range.
BFFC0008  Parameter 8 out of range.
BFFC0011  Instrument returned invalid response to ID Query

BFFC0800  Error Opening File      VI_ERROR_INSTR_FILE_OPEN
BFFC0801  Error Writing to File   VI_ERROR_INSTR_FILE_WRITE
BFFC0803  Invalid Response VI_ERROR_INSTR_INTERPRETING_RESPONSE
BFFC0809  Parameter 9 out of range.  VI_ERROR_INSTR_PARAMETER9
BFFC080A  Parameter 10 out of range. VI_ERROR_INSTR_PARAMETER10
BFFC080B  Parameter 11 out of range. VI_ERROR_INSTR_PARAMETER11
BFFC080C  Parameter 12 out of range. VI_ERROR_INSTR_PARAMETER12   -   D  �    Instrument Handle                � -    �    Ambient Temperature              � -�   �    Over Temperature Margin          [#���b  �    Status                                 	            	            	          :    This function resets the instrument to a known state and sends initialization commands to the instrument.  The initialization commands set instrument settings such as Headers Off, Short Command form, and Data Transfer Binary to the state necessary for the operation of the instrument driver.

SCPI Command:
*RST
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the agn6k7kni_error_message function.  To obtain additional information about the error condition, call the agn6k7kni_GetError function.  To clear the error information from the driver, call the agn6k7kni_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
None 

ERRORS:
None 
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviDCPwr Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviDCPwr Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

     �    The ViSession handle that you obtain from the agn6k7kni_init or agn6k7kni_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   ?#���b  �    Status                           �-   D  �    Instrument Handle                  	                  This function resets the instrument and applies initial user specified settings from the Logical Name which was used to initialize the session.  If the session was created without a Logical Name, this function is equivalent to the agn6k7kni_reset function.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the agn6k7kni_error_message function.  To obtain additional information about the error condition, call the agn6k7kni_GetError function.  To clear the error information from the driver, call the agn6k7kni_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
None 

ERRORS:
None  
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviDCPwr Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviDCPwr Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

     �    The ViSession handle that you obtain from the agn6k7kni_init or agn6k7kni_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   #���b  �    Status                           �-   D  �    Instrument Handle                  	               �    This function places the instrument in a quiescent state where it has minimal or no impact on the system to which it is connected.

Notes: 
(1) This function is not supported.      �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the agn6k7kni_error_message function.  To obtain additional information about the error condition, call the agn6k7kni_GetError function.  To clear the error information from the driver, call the agn6k7kni_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
None 

ERRORS:
None  
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviDCPwr Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviDCPwr Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

     �    The ViSession handle that you obtain from the agn6k7kni_init or agn6k7kni_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   �#���b  �    Status                           %@-   D  �    Instrument Handle                  	               o    This function runs the instrument's self test routine and returns the test result(s). 

SCPI Command:
*TST?

    &    This control contains the value returned from the instrument self test.  Zero means success.  For any other code, see the device's operator's manual.

Self-Test Code    Description
---------------------------------------
   0              Passed self test
   1              Self test failed

     �    Returns the self-test response string from the instrument. See the device's operation manual for an explanation of the string's contents.

You must pass a ViChar array with at least 256 bytes.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the agn6k7kni_error_message function.  To obtain additional information about the error condition, call the agn6k7kni_GetError function.  To clear the error information from the driver, call the agn6k7kni_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
None 

ERRORS:
None  
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviDCPwr Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviDCPwr Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

     �    The ViSession handle that you obtain from the agn6k7kni_init or agn6k7kni_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   &� =  &  �    Self Test Result                 ( = �  ,    Self-Test Message                (�#���b  �    Status                           /�-   D  �    Instrument Handle                  	           	            	               `    This function returns the revision numbers of the instrument driver and instrument firmware.

     �    Returns the instrument driver software revision numbers in the form of a string.

You must pass a ViChar array with at least 256 bytes.     �    Returns the instrument firmware revision numbers in the form of a string.

You must pass a ViChar array with at least 256 bytes.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the agn6k7kni_error_message function.  To obtain additional information about the error condition, call the agn6k7kni_GetError function.  To clear the error information from the driver, call the agn6k7kni_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
None 

ERRORS:
None  
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviDCPwr Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviDCPwr Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

     �    The ViSession handle that you obtain from the agn6k7kni_init or agn6k7kni_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   1� = X  �    Instrument Driver Revision       21 � X  �    Firmware Revision                2�#���b  �    Status                           9W-   D  �    Instrument Handle                  	            	            	               V    This function reads an error code and a message from the instrument's error queue.

     B    Returns the error code read from the instrument's error queue.

     �    Returns the error message string read from the instrument's error message queue.

You must pass a ViChar array with at least 256 bytes.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the agn6k7kni_error_message function.  To obtain additional information about the error condition, call the agn6k7kni_GetError function.  To clear the error information from the driver, call the agn6k7kni_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
None 

ERRORS:
None 
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviDCPwr Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviDCPwr Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

     �    The ViSession handle that you obtain from the agn6k7kni_init or agn6k7kni_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   ;m =  0  �    Error Code                       ;� = �  ,    Error Message                    <I#���b  �    Status                           B�-   D  �    Instrument Handle                  	           	            	               n    This function converts a status code returned by an instrument driver function into a user-readable string.     %    Pass the Status parameter that is returned from any of the instrument driver functions.
          
Default Value:  0  (VI_SUCCESS)
          
agn6k7kni Status Codes:
Status    Description
-------------------------------------------------
WARNINGS:
None 

ERRORS:
None  

IviDCPwr Status Codes:
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.

IVI Engine Status Codes:
Status    Description
-------------------------------------------------
ERRORS:
BFFA0001  Instrument error. Call agn6k7kni_error_query.
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
BFFC0012  Invalid response from instrument.     �    Returns the user-readable message string that corresponds to the status code you specify.

You must pass a ViChar array with at least 256 bytes.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the agn6k7kni_error_message function.  To obtain additional information about the error condition, call the agn6k7kni_GetError function.  To clear the error information from the driver, call the agn6k7kni_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
None 

ERRORS:
None  
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviDCPwr Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviDCPwr Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

        The ViSession handle that you obtain from the agn6k7kni_init or agn6k7kni_InitWithOptions function.  The handle identifies a particular instrument session.

You can pass VI_NULL for this parameter.  This is useful when one of the initialize functions fail.

Default Value:  VI_NULL
   E =  b  h    Error Code                       j8 = �  �    Error Message                    j�#���b  �    Status                           qn-   D  �    Instrument Handle                  0    	            	           VI_NULL    P    This function invalidates the cached values of all attributes for the session.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the agn6k7kni_error_message function.  To obtain additional information about the error condition, call the agn6k7kni_GetError function.  To clear the error information from the driver, call the agn6k7kni_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
None 

ERRORS:
None  
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviDCPwr Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviDCPwr Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

     �    The ViSession handle that you obtain from the agn6k7kni_init or agn6k7kni_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   s�#���b  �    Status                           z�-   D  �    Instrument Handle                  	              b    This function returns the highest-level channel name that corresponds to the specific driver channel string that is in the channel table at an index you specify.  By passing 0 for the buffer size, the caller can ascertain the buffer size required to get the entire channel name string and then call the function again with a sufficiently large buffer.
     �    The ViSession handle that you obtain from the agn6k7kni_init or agn6k7kni_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    1    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the return buffer, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, or if the status code is not listed below, call the agn6k7kni_error_message function.  To obtain additional information about the error condition, use the agn6k7kni_GetError and agn6k7kni_ClearError functions.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
None 

ERRORS:
None  
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviDCPwr Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviDCPwr Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors
     <    A 1-based index into the channel table.

Default Value: 1
        Returns the highest-level channel name that corresponds to the specific driver channel string that is in the channel table at an index you specify..

The buffer must contain at least as many elements as the value you specify with the Buffer Size parameter.  If the channel name description, including the terminating NUL byte, contains more bytes than you indicate with the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass 0 for the Buffer Size, you can pass VI_NULL for this parameter.    �    Pass the number of bytes in the ViChar array you specify for the Channel Name parameter.

If the channel name, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies BufferSize - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Channel Name buffer parameter.

Default Value:  None   }!-   D  �    Instrument Handle                }�#���b  �    Status or Required Size          � = 0 0  �    Index                            �Y �6   �    Channel Name                     �g � 1 0  �    Buffer Size                            	           1    	               �    This function retrieves and then clears the IVI error information for the session or the current execution thread. One exception exists: If the BufferSize parameter is 0, the function does not clear the error information. By passing 0 for the buffer size, the caller can ascertain the buffer size required to get the entire error description string and then call the function again with a sufficiently large buffer.

If the user specifies a valid IVI session for the InstrumentHandle parameter, Get Error retrieves and then clears the error information for the session.  If the user passes VI_NULL for the InstrumentHandle parameter, this function retrieves and then clears the error information for the current execution thread.  If the InstrumentHandle parameter is an invalid session, the function does nothing and returns an error. Normally, the error information describes the first error that occurred since the user last called agn6k7kni_GetError or agn6k7kni_ClearError.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the return buffer, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the agn6k7kni_error_message function.  To obtain additional information about the error condition, call the agn6k7kni_GetError function.  To clear the error information from the driver, call the agn6k7kni_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
None 

ERRORS:
None  
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    The ViSession handle that you obtain from the agn6k7kni_init or agn6k7kni_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Pass the number of bytes in the ViChar array you specify for the Description parameter.

If the error description, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies BufferSize - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Description buffer parameter.

Default Value:  None     �    Returns the error code for the session or execution thread.

If you pass 0 for the Buffer Size, you can pass VI_NULL for this parameter.
    �    Returns the error description for the IVI session or execution thread.  If there is no description, the function returns an empty string.

The buffer must contain at least as many elements as the value you specify with the Buffer Size parameter.  If the error description, including the terminating NUL byte, contains more bytes than you indicate with the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass 0 for the Buffer Size, you can pass VI_NULL for this parameter.   �O#���b  �    Status or Required Size          �R-   D  �    Instrument Handle                � 3< 0  �    BufferSize                       �� 3 P b  �    Code                             �� � Q  �    Description                        	                   	           	           g    This function clears the error code and error description for the IVI session. If the user specifies a valid IVI session for the InstrumentHandle parameter, this function clears the error information for the session. If the user passes VI_NULL for the Vi parameter, this function clears the error information for the current execution thread. If the Vi parameter is an invalid session, the function does nothing and returns an error.
The function clears the error code by setting it to VI_SUCCESS.  If the error description string is non-NULL, the function de-allocates the error description string and sets the address to VI_NULL.

Maintaining the error information separately for each thread is useful if the user does not have a session handle to pass to the agn6k7kni_GetError function, which occurs when a call to agn6k7kni_init or agn6k7kni_InitWithOptions fails.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the agn6k7kni_error_message function.  To obtain additional information about the error condition, call the agn6k7kni_GetError function.  To clear the error information from the driver, call the agn6k7kni_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
None 

ERRORS:
None  
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviDCPwr Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviDCPwr Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

     �    The ViSession handle that you obtain from the agn6k7kni_init or agn6k7kni_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   �!#���b  �    Status                           ��-   D  �    Instrument Handle                  	              �    This function returns the coercion information associated with the IVI session.  This function retrieves and clears the oldest instance in which the instrument driver coerced a value you specified to another value.

If you set the AGN6K7KNI_ATTR_RECORD_COERCIONS attribute to VI_TRUE, the instrument driver keeps a list of all coercions it makes on ViInt32 or ViReal64 values you pass to instrument driver functions.  You use this function to retrieve information from that list.

If the next coercion record string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Coercion Record buffer parameter.

The function returns an empty string in the Coercion Record parameter if no coercion records remain for the session.

    O    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the return buffer, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the agn6k7kni_error_message function.  To obtain additional information about the error condition, call the agn6k7kni_GetError function.  To clear the error information from the driver, call the agn6k7kni_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
None 

ERRORS:
None
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviDCPwr Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviDCPwr Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

     �    The ViSession handle that you obtain from the agn6k7kni_init function.  The handle identifies a particular instrument session.

Default Value:  None    �    Returns the next coercion record for the IVI session.  If there are no coercion records, the function returns an empty string.

The buffer must contain at least as many elements as the value you specify with the Buffer Size parameter.  If the next coercion record string, including the terminating NUL byte, contains more bytes than you indicate with the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

This parameter returns an empty string if no coercion records remain for the session.
    �    Pass the number of bytes in the ViChar array you specify for the Coercion Record parameter.

If the next coercion record string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Coercion Record buffer parameter.

Default Value:  None

   ��#���b  �    Status or Required Size          �"-   D  �    Instrument Handle                �� � Q  �    Coercion Record                  �� = � 0  �    Buffer Size                        	               	               0    This function returns the interchangeability warnings associated with the IVI session. It retrieves and clears the oldest instance in which the class driver recorded an interchangeability warning.  Interchangeability warnings indicate that using your application with a different instrument might cause different behavior. You use this function to retrieve interchangeability warnings.

The driver performs interchangeability checking when the AGN6K7KNI_ATTR_INTERCHANGE_CHECK attribute is set to VI_TRUE.

The function returns an empty string in the Interchange Warning parameter if no interchangeability warnings remain for the session.

In general, the instrument driver generates interchangeability warnings when an attribute that affects the behavior of the instrument is in a state that you did not specify.
    1    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the return buffer, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, or if the status code is not listed below, call the agn6k7kni_error_message function.  To obtain additional information about the error condition, use the agn6k7kni_GetError and agn6k7kni_ClearError functions.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
None 

ERRORS:
None  
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviDCPwr Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviDCPwr Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors
     �    The ViSession handle that you obtain from the agn6k7kni_init or agn6k7kni_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Pass the number of bytes in the ViChar array you specify for the Interchange Warning parameter.

If the next interchangeability warning string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value. For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Interchange Warning buffer parameter.

Default Value:  None
        Returns the next interchange warning for the IVI session. If there are no interchange warnings, the function returns an empty  string.

The buffer must contain at least as many elements as the value you specify with the Buffer Size parameter. If the next interchangeability warning string, including the terminating NUL byte, contains more bytes than you indicate with the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

This parameter returns an empty string if no interchangeability
warnings remain for the session.

   ��#���b  �    Status or Required Size          � -   D  �    Instrument Handle                �� = � 0  �    Buffer Size                      �� � Q  �    Interchange Warning                	                   	            A    This function clears the list of current interchange warnings.
     �    The ViSession handle that you obtain from the agn6k7kni_init or agn6k7kni_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the agn6k7kni_error_message function.  To obtain additional information about the error condition, call the agn6k7kni_GetError function.  To clear the error information from the driver, call the agn6k7kni_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
None 

ERRORS:
None  
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviDCPwr Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviDCPwr Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

   �C-   D  �    Instrument Handle                ��#���b  �    Status                                 	          �    When developing a complex test system that consists of multiple test modules, it is generally a good idea to design the test modules so that they can run in any order.  To do so requires ensuring that each test module completely configures the state of each instrument it uses.  If a particular test module does not completely configure the state of an instrument, the state of the instrument depends on the configuration from a previously executed test module.  If you execute the test modules in a different order, the behavior of the instrument and therefore the entire test module is likely to change.  This change in behavior is generally instrument specific and represents an interchangeability problem.

You can use this function to test for such cases.  After you call this function, the interchangeability checking algorithms in the specific driver ignore all previous configuration operations.  By calling this function at the beginning of a test module, you can determine whether the test module has dependencies on the operation of previously executed test modules.

This function does not clear the interchangeability warnings from the list of previously recorded interchangeability warnings.  If you want to guarantee that the agn6k7kni_GetNextInterchangeWarning function only returns those interchangeability warnings that are generated after calling this function, you must clear the list of interchangeability warnings.  You can clear the interchangeability warnings list by repeatedly calling the agn6k7kni_GetNextInterchangeWarning function until no more interchangeability warnings are returned.  If you are not interested in the content of those warnings, you can call the agn6k7kni_ClearInterchangeWarnings function.
     �    The ViSession handle that you obtain from the agn6k7kni_init or agn6k7kni_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the agn6k7kni_error_message function.  To obtain additional information about the error condition, call the agn6k7kni_GetError function.  To clear the error information from the driver, call the agn6k7kni_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
None 

ERRORS:
None  
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviDCPwr Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviDCPwr Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

   ��-   D  �    Instrument Handle                �#���b  �    Status                                 	          F    This function obtains a multithread lock on the instrument session.  Before it does so, it waits until all other execution threads have released their locks on the instrument session.

Other threads might have obtained a lock on this session in the following ways:

- The user's application called agn6k7kni_LockSession.

- A call to the instrument driver locked the session.

- A call to the IVI engine locked the session.

After your call to agn6k7kni_LockSession returns successfully, no other threads can access the instrument session until you call agn6k7kni_UnlockSession.

Use agn6k7kni_LockSession and agn6k7kni_UnlockSession around a sequence of calls to instrument driver functions if you require that the instrument retain its settings through the end of the sequence.

You can safely make nested calls to agn6k7kni_LockSession within the same thread.  To completely unlock the session, you must balance each call to agn6k7kni_LockSession with a call to agn6k7kni_UnlockSession.  If, however, you use the Caller Has Lock parameter in all calls to agn6k7kni_LockSession and agn6k7kni_UnlockSession within a function, the IVI Library locks the session only once within the function regardless of the number of calls you make to agn6k7kni_LockSession.  This allows you to call agn6k7kni_UnlockSession just once at the end of the function. 
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the agn6k7kni_error_message function.  To obtain additional information about the error condition, call the agn6k7kni_GetError function.  To clear the error information from the driver, call the agn6k7kni_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
None 

ERRORS:
None  
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviDCPwr Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviDCPwr Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

     �    The ViSession handle that you obtain from the agn6k7kni_init or agn6k7kni_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    This parameter serves as a convenience.  If you do not want to use this parameter, pass VI_NULL. 

Use this parameter in complex functions to keep track of whether you obtain a lock and therefore need to unlock the session.  Pass the address of a local ViBoolean variable.  In the declaration of the local variable, initialize it to VI_FALSE.  Pass the address of the same local variable to any other calls you make to agn6k7kni_LockSession or agn6k7kni_UnlockSession in the same function.

The parameter is an input/output parameter.  agn6k7kni_LockSession and agn6k7kni_UnlockSession each inspect the current value and take the following actions:

- If the value is VI_TRUE, agn6k7kni_LockSession does not lock the session again.  If the value is VI_FALSE, agn6k7kni_LockSession obtains the lock and sets the value of the parameter to VI_TRUE.

- If the value is VI_FALSE, agn6k7kni_UnlockSession does not attempt to unlock the session.  If the value is VI_TRUE, agn6k7kni_UnlockSession releases the lock and sets the value of the parameter to VI_FALSE.
 
Thus, you can, call agn6k7kni_UnlockSession at the end of your function without worrying about whether you actually have the lock.  

Example:

ViStatus TestFunc (ViSession vi, ViInt32 flags)
{
    ViStatus error = VI_SUCCESS;
    ViBoolean haveLock = VI_FALSE;

    if (flags & BIT_1)
        {
        viCheckErr( agn6k7kni_LockSession(vi, &haveLock));
        viCheckErr( TakeAction1(vi));
        if (flags & BIT_2)
            {
            viCheckErr( agn6k7kni_UnlockSession(vi, &haveLock));
            viCheckErr( TakeAction2(vi));
            viCheckErr( agn6k7kni_LockSession(vi, &haveLock);
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
    agn6k7kni_UnlockSession(vi, &haveLock);
    return error;
}   �#���b  �    Status                           ��-   D  �    Instrument Handle                �_ H � N  �    Caller Has Lock                    	               	            �    This function releases a lock that you acquired on an instrument session using agn6k7kni_LockSession.  Refer to agn6k7kni_LockSession for additional information on session locks.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the agn6k7kni_error_message function.  To obtain additional information about the error condition, call the agn6k7kni_GetError function.  To clear the error information from the driver, call the agn6k7kni_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
None 

ERRORS:
None 
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviDCPwr Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviDCPwr Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

     �    The ViSession handle that you obtain from the agn6k7kni_init or agn6k7kni_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    This parameter serves as a convenience.  If you do not want to use this parameter, pass VI_NULL. 

Use this parameter in complex functions to keep track of whether you obtain a lock and therefore need to unlock the session. 
Pass the address of a local ViBoolean variable.  In the declaration of the local variable, initialize it to VI_FALSE.  Pass the address of the same local variable to any other calls you make to agn6k7kni_LockSession or agn6k7kni_UnlockSession in the same function.

The parameter is an input/output parameter.  agn6k7kni_LockSession and agn6k7kni_UnlockSession each inspect the current value and take the following actions:

- If the value is VI_TRUE, agn6k7kni_LockSession does not lock the session again.  If the value is VI_FALSE, agn6k7kni_LockSession obtains the lock and sets the value of the parameter to VI_TRUE.

- If the value is VI_FALSE, agn6k7kni_UnlockSession does not attempt to unlock the session.  If the value is VI_TRUE, agn6k7kni_UnlockSession releases the lock and sets the value of the parameter to VI_FALSE.
 
Thus, you can, call agn6k7kni_UnlockSession at the end of your function without worrying about whether you actually have the lock.  

Example:

ViStatus TestFunc (ViSession vi, ViInt32 flags)
{
    ViStatus error = VI_SUCCESS;
    ViBoolean haveLock = VI_FALSE;

    if (flags & BIT_1)
        {
        viCheckErr( agn6k7kni_LockSession(vi, &haveLock));
        viCheckErr( TakeAction1(vi));
        if (flags & BIT_2)
            {
            viCheckErr( agn6k7kni_UnlockSession(vi, &haveLock));
            viCheckErr( TakeAction2(vi));
            viCheckErr( agn6k7kni_LockSession(vi, &haveLock);
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
    agn6k7kni_UnlockSession(vi, &haveLock);
    return error;
}   �#���b  �    Status                           N-   D  �    Instrument Handle                	
 H � N  �    Caller Has Lock                    	               	            �    This function writes a user-specified string to the instrument.

Note:  This function bypasses IVI attribute state caching.  Therefore, when you call this function, the cached values for all attributes will be invalidated.     2    Pass the string to be written to the instrument.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the agn6k7kni_error_message function.  To obtain additional information about the error condition, call the agn6k7kni_GetError function.  To clear the error information from the driver, call the agn6k7kni_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
None 

ERRORS:
None  
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviDCPwr Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviDCPwr Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

     �    The ViSession handle that you obtain from the agn6k7kni_init or agn6k7kni_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   � A �   �    Write Buffer                     �#���b  �    Status                           _-   D  �    Instrument Handle                      	               /    This function reads data from the instrument.     c    After this function executes, this parameter contains the data that was read from the instrument.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the agn6k7kni_error_message function.  To obtain additional information about the error condition, call the agn6k7kni_GetError function.  To clear the error information from the driver, call the agn6k7kni_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
None 

ERRORS:
None 
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviDCPwr Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviDCPwr Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

     �    The ViSession handle that you obtain from the agn6k7kni_init or agn6k7kni_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
     �    Pass the maximum number of bytes to read from the instruments.  

Valid Range:  0 to the number of elements in the Read Buffer.

Default Value:  256

     ^    Returns the number of bytes actually read from the instrument and stored in the Read Buffer.    @   �    Read Buffer                      p#���b  �    Status                           "
-   D  �    Instrument Handle                "� @ C 0  �    Number of Bytes To Read          #f �' 0  �    Num Bytes Read                     	            	               256    	           �    This function performs the following operations:

- Closes the instrument I/O session.

- Destroys the instrument driver session and all of its attributes.

- Deallocates any memory resources the driver uses.

Notes:

(1) You must unlock the session before calling agn6k7kni_close.

(2) After calling agn6k7kni_close, you cannot use the instrument driver again until you call agn6k7kni_init or agn6k7kni_InitWithOptions.

    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the agn6k7kni_error_message function.  To obtain additional information about the error condition, call the agn6k7kni_GetError function.  To clear the error information from the driver, call the agn6k7kni_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
None 

ERRORS:
None  
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviDCPwr Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviDCPwr Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

     �    The ViSession handle that you obtain from the agn6k7kni_init or agn6k7kni_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   &�#���b  �    Status                           -O-   D  �    Instrument Handle                  	            ����         2  +�             K.        init                                                                                                                                    ����         -�  Py             K.        InitWithOptions                                                                                                                         ����         R�  ]�             K.        ConfigureVoltageLevel                                                                                                                   ����         ^�  jE             K.        ConfigureCurrentLimit                                                                                                                   ����         k�  w�             K.        ConfigureNegativeCurrentLimit                                                                                                           ����         x�  �Q             K.        ConfigureCurrentLevel                                                                                                                   ����         �D  ��             K.        ConfigureVoltageLimit                                                                                                                   ����         ��  �              K.        ConfigureOutputPriorityMode                                                                                                             ����         �z  ��             K.        ConfigureOutputSequenceDelay                                                                                                            ����         ��  ��             K.        ConfigureOutputSequencing                                                                                                               ����         ��  ��             K.        ConfigureOutputEnabled                                                                                                                  ����         ��  ;             K.        ConfigureOutputRelay                                                                                                                    ����         ϸ  �D             K.        ConfigureCurrentSharing                                                                                                                 ����         �N  ��             K.        ConfigureOutputBandwidth                                                                                                                ����         �^  �C             K.        ConfigureOutputResistance                                                                                                               ����         �� g             K.        ConfigureSlewRate                                                                                                                       ����        q �             K.        ConfigureOutputRange                                                                                                                    ����         �             K.        ConfigureSampling                                                                                                                       ����         ( )�             K.        ConfigureNPLC                                                                                                                           ����        *x 5s             K.        ConfigureWindowing                                                                                                                      ����        6� A�             K.        ConfigureAcqTriggerSource                                                                                                               ����        EN Qc             K.        ConfigureAcqTriggeredVoltage                                                                                                            ����        R� `�             K.        ConfigureAcqTriggeredCurrent                                                                                                            ����        bL m�             K.        ConfigureTransientMode                                                                                                                  ����        o* y�             K.        ConfigureTriggeredVoltageLevel                                                                                                          ����        z� �B             K.        ConfigureTriggeredCurrentLevel                                                                                                          ����        �5 �>             K.        ConfigureTriggeredCurrentLimit                                                                                                          ����        �. ��             K.        ConfigureTriggerOutEnabled                                                                                                              ����        �� �             K.        ConfigureTriggerSource                                                                                                                  ����        �s �f             K.        ConfigureList                                                                                                                           ����        �B ��             K.        ConfigureLevelList                                                                                                                      ����        � �1             K.        ConfigureTriggerOutList                                                                                                                 ����        ӣ ��             K.        ConfigureDwellList                                                                                                                      ����        � �w             K.        ConfigureArbWaveform                                                                                                                    ����        �� ��             K.        ConfigureConstantDwellWaveform                                                                                                          ����        �� m             K.        ConfigureArbTriggerSource                                                                                                               ����        	� }             K.        ConfigureOVP                                                                                                                            ����        � #X             K.        ConfigureOCP                                                                                                                            ����        %M .�             K.        ConfigureInhibitInputMode                                                                                                               ����        0? 9             K.        ConfigureWatchdogTimer                                                                                                                  ����        :� B;             K.        ConfigureSenseFaultDetection                                                                                                            ����        C	 O�             K.        ConfigurePin                                                                                                                            ����        T~ \�             K.        ConfigureBusTriggerEnabled                                                                                                              ����        ]� d�             K.        ReadInputData                                                                                                                           ����        e� nd             K.        WriteOutputData                                                                                                                         ����        o w�             K.        DefineSignalExpression                                                                                                                  ����        xs �             K.        ConfigureOutputCoupleSource                                                                                                             ����        �� ��             K.        ConfigureUserProtection                                                                                                                 ����        �k ��             K.        ConfigureThresholdComparators                                                                                                           ����        �r ��             K.        ConfigureElog                                                                                                                           ����        �� ��             K.        ConfigureElogMeasurement                                                                                                                ����        �� �7             K.        ConfigureCalibrationMode                                                                                                                ����        Ϻ ؈             K.        ConfigureCalibration                                                                                                                    ����        �� ��             K.        ConfigureCalibrationEnabled                                                                                                             ����        �� ��             K.        SetAttributeViInt32                                                                                                                     ����        �$ �             K.        SetAttributeViReal64                                                                                                                    ����        R #�             K.        SetAttributeViString                                                                                                                    ����        %� :             K.        SetAttributeViBoolean                                                                                                                   ����        ;� PE             K.        SetAttributeViSession                                                                                                                   ����        Q� bX             K.        GetAttributeViInt32                                                                                                                     ����        c� t             K.        GetAttributeViReal64                                                                                                                    ����        uM �j             K.        GetAttributeViString                                                                                                                    ����        �� �c             K.        GetAttributeViBoolean                                                                                                                   ����        �� �             K.        GetAttributeViSession                                                                                                                   ����        �\ Ņ             K.        CheckAttributeViInt32                                                                                                                   ����        �  �K             K.        CheckAttributeViReal64                                                                                                                  ����        �� �             K.        CheckAttributeViString                                                                                                                  ����        � ��             K.        CheckAttributeViBoolean                                                                                                                 ����        �u �             K.        CheckAttributeViSession                                                                                                                 ����        > y             K.        Initiate                                                                                                                                ����        � �             K.        Abort                                                                                                                                   ����        � $�             K.        SendSoftwareTrigger                                                                                                                     ����        %E 0�             K.        QueryMaxCurrentLimit                                                                                                                    ����        2 C]             K.        QueryOutputState                                                                                                                        ����        Fs S�             K.        QueryMaxVoltageLevel                                                                                                                    ����        T� [�             K.        QueryMaxOutputDelayOffset                                                                                                               ����        \� d             K.        QueryCalibrationCount                                                                                                                   ����        d� l~             K.        ResetOutputProtection                                                                                                                   ����        m4 u�             K.        ResetAhoWhoMeasurements                                                                                                                 ����        v� ��             K.        InitiateAcquisition                                                                                                                     ����        �g �O             K.        AbortAcquisition                                                                                                                        ����        � ��             K.        SendAcquisitionTrigger                                                                                                                  ����        �Y ��             K.        QueryAcquisitionWtgState                                                                                                                ����        �� ��             K.        InitiateDatalog                                                                                                                         ����        �� �             K.        AbortDatalog                                                                                                                            ����        �� �d             K.        SendDatalogTrigger                                                                                                                      ����        � �M             K.        FetchDatalog                                                                                                                            ����        �� �=             K.        Fetch                                                                                                                                   ����        �� �L         
    K.        FetchArray                                                                                                                              ����        �N �C             K.        Measure                                                                                                                                 ����        �C  �         	    K.        MeasureArray                                                                                                                            ����        �              K.        MeasureTemperature                                                                                                                      ����        � �             K.        reset                                                                                                                                   ����         p             K.        ResetWithDefaults                                                                                                                       ����        � %�             K.        Disable                                                                                                                                 ����        &v 0<             K.        self_test                                                                                                                               ����        18 :             K.        revision_query                                                                                                                          ����        ; C�             K.        error_query                                                                                                                             ����        D� r�             K.        error_message                                                                                                                           ����        s� {=             K.        InvalidateAllAttributes                                                                                                                 ����        {� �D             K.        GetChannelName                                                                                                                          ����        �r �}             K.        GetError                                                                                                                                ����        �� �x             K.        ClearError                                                                                                                              ����        �� ��             K.        GetNextCoercionRecord                                                                                                                   ����        �� �             K.        GetNextInterchangeWarning                                                                                                               ����        �� ܚ             K.        ClearInterchangeWarnings                                                                                                                ����        � �@             K.        ResetInterchangeCheck                                                                                                                   ����        �  <             K.        LockSession                                                                                                                             ����         � �             K.        UnlockSession                                                                                                                           ����        �              K.        WriteInstrData                                                                                                                          ����        � #�             K.        ReadInstrData                                                                                                                           ����        % .             K.        close                                                                                                                                         �                                                                                     �Initialize                                                                           �Initialize With Options                                                             �Configuration Functions                                                             �Output                                                                               �Configure Voltage Level                                                              �Configure Current Limit                                                              �Configure Negative Current Limit                                                     �Configure Current Level                                                              �Configure Voltage Limit                                                              �Configure Output Priority Mode                                                       �Configure Output Sequence Delay                                                      �Configure Output Sequencing                                                          �Configure Output Enabled                                                            Advanced                                                                             �Configure Output Relay                                                               �Configure Current Sharing                                                            �Configure Output Bandwidth                                                           �Configure Output Resistance                                                          �Configure Slew Rate                                                                 [Measurement                                                                          �Configure Output Range                                                               �Configure Sampling                                                                   �Configure NPLC                                                                       �Configure Windowing                                                                 �Acquisition                                                                          �Configure Acq Trigger Source                                                         �Configure Acq Triggered Voltage                                                      �Configure Acq Triggered Current                                                     Transient                                                                            �Configure Transient Mode                                                             �Configure Triggered Voltage Level                                                    �Configure Triggered Current Level                                                    �Configure Triggered Current Limit                                                    �Configure Trigger Out Enabled                                                        �Configure Trigger Source                                                            yList                                                                                 �Configure List                                                                       �Configure Level List                                                                 �Configure Trigger Out List                                                           �Configure Dwell List                                                                �Arbitrary Waveform                                                                   �Configure Arb Waveform                                                               �Configure Constant Dwell Waveform                                                    �Configure Arb Trigger Source                                                        �Protection                                                                           �Configure OVP                                                                        �Configure OCP                                                                        �Configure Inhibit Input Mode                                                         �Configure Watchdog Timer                                                             �Configure Sense Fault Detection                                                     �System                                                                              	4Digital Port                                                                         �Configure Pin                                                                        �Configure Bus Trigger Enabled                                                        �Read Input Data                                                                      �Write Output Data                                                                   	�Signal                                                                               �Define Signal Expression                                                             �Configure Output Couple Source                                                       �Configure User Protection                                                            �Configure Threshold Comparators                                                     	�Datalog                                                                              �Configure Elog                                                                       �Configure Elog Measurement                                                          
WCalibration                                                                          �Configure Calibration Mode                                                           �Configure Calibration                                                                �Configure Calibration Enabled                                                       
�Set/Get/Check Attribute                                                             Set Attribute                                                                        �Set Attribute ViInt32                                                                �Set Attribute ViReal64                                                               �Set Attribute ViString                                                               �Set Attribute ViBoolean                                                              �Set Attribute ViSession                                                             �Get Attribute                                                                        �Get Attribute ViInt32                                                                �Get Attribute ViReal64                                                               �Get Attribute ViString                                                               �Get Attribute ViBoolean                                                              �Get Attribute ViSession                                                             *Check Attribute                                                                      �Check Attribute ViInt32                                                              �Check Attribute ViReal64                                                             �Check Attribute ViString                                                             �Check Attribute ViBoolean                                                            �Check Attribute ViSession                                                           �Action/Status Functions                                                              Low Level                                                                            �Initiate                                                                             �Abort                                                                                �Send Software Trigger                                                                �Query Max Current Limit                                                              �Query Output State                                                                   �Query Max Voltage Level                                                              �Query Max Output Delay Offset                                                        �Query Calibration Count                                                              �Reset Output Protection                                                              �Reset AHO/WHO Measurements                                                          �Measurement Functions                                                               MLow Level                                                                            �Initiate Acquisition                                                                 �Abort Acquisition                                                                    �Send Acquisition Trigger                                                             �Query Acquisition WTG State                                                          �Initiate Datalog                                                                     �Abort Datalog                                                                        �Send Datalog Trigger                                                                 �Fetch Datalog                                                                        �Fetch                                                                                �Fetch Array                                                                          �Measure                                                                              �Measure Array                                                                        �Measure Temperature                                                                 Utility Functions                                                                    �Reset                                                                                �Reset With Defaults                                                                  �Disable                                                                              �Self-Test                                                                            �Revision Query                                                                       �Error-Query                                                                          �Error Message                                                                        �Invalidate All Attributes                                                            �Get Channel Name                                                                    ~Error Info                                                                           �Get Error                                                                            �Clear Error                                                                         �Coercion Info                                                                        �Get Next Coercion Record                                                            Interchangeability Info                                                              �Get Next Interchange Warning                                                         �Clear Interchange Warnings                                                           �Reset Interchange Check                                                             qLocking                                                                              �Lock Session                                                                         �Unlock Session                                                                      �Instrument I/O                                                                       �Write Instrument Data                                                                �Read Instrument Data                                                                 �Close                                                                           