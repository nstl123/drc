/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this service wrapper you may modify the generated sub-class of this class - Depot21.as.
 */
package services.depot21
{
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.services.wrapper.RemoteObjectServiceWrapper;
import com.adobe.serializers.utility.TypeUtility;
import mx.rpc.AbstractOperation;
import mx.rpc.AsyncToken;
import mx.rpc.remoting.Operation;
import mx.rpc.remoting.RemoteObject;
import valueObjects.CountryName;
import valueObjects.CustomDatatype11;
import valueObjects.CustomDatatype15;
import valueObjects.CustomDatatype16;
import valueObjects.CustomDatatype17;

import mx.collections.ItemResponder;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;

[ExcludeClass]
internal class _Super_Depot21 extends com.adobe.fiber.services.wrapper.RemoteObjectServiceWrapper
{

    // Constructor
    public function _Super_Depot21()
    {
        // initialize service control
        _serviceControl = new mx.rpc.remoting.RemoteObject();

        // initialize RemoteClass alias for all entities returned by functions of this service
        valueObjects.CustomDatatype11._initRemoteClassAlias();
        valueObjects.CountryName._initRemoteClassAlias();
        valueObjects.CustomDatatype16._initRemoteClassAlias();
        valueObjects.CustomDatatype17._initRemoteClassAlias();
        valueObjects.CustomDatatype15._initRemoteClassAlias();

        var operations:Object = new Object();
        var operation:mx.rpc.remoting.Operation;

        operation = new mx.rpc.remoting.Operation(null, "getMacroData");
         operation.resultElementType = valueObjects.CustomDatatype11;
        operations["getMacroData"] = operation;
        operation = new mx.rpc.remoting.Operation(null, "getMacroDataFormat");
         operation.resultElementType = valueObjects.CountryName;
        operations["getMacroDataFormat"] = operation;
        operation = new mx.rpc.remoting.Operation(null, "getDemandData");
         operation.resultElementType = valueObjects.CustomDatatype16;
        operations["getDemandData"] = operation;
        operation = new mx.rpc.remoting.Operation(null, "getDeviceBase");
         operation.resultElementType = valueObjects.CustomDatatype17;
        operations["getDeviceBase"] = operation;
        operation = new mx.rpc.remoting.Operation(null, "getDemandByChemistry");
         operation.resultElementType = valueObjects.CustomDatatype15;
        operations["getDemandByChemistry"] = operation;

        _serviceControl.operations = operations;
        _serviceControl.convertResultHandler = com.adobe.serializers.utility.TypeUtility.convertResultHandler;
        _serviceControl.source = "Depot21";
        _serviceControl.endpoint = "gateway.php";
        destination = "Depot21";



         model_internal::initialize();
    }

    /**
      * This method is a generated wrapper used to call the 'getMacroData' operation. It returns an mx.rpc.AsyncToken whose 
      * result property will be populated with the result of the operation when the server response is received. 
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function getMacroData(countryIDs:Object, indicatorID:Object, scenarioID:Object, hasSplit:Object, typeID:Object, wNames:int) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("getMacroData");
        var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(countryIDs,indicatorID,scenarioID,hasSplit,typeID,wNames) ;

        return _internal_token;
    }
     
    /**
      * This method is a generated wrapper used to call the 'getMacroDataFormat' operation. It returns an mx.rpc.AsyncToken whose 
      * result property will be populated with the result of the operation when the server response is received. 
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function getMacroDataFormat(n:Number) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("getMacroDataFormat");
        var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(n) ;

        return _internal_token;
    }
     
    /**
      * This method is a generated wrapper used to call the 'getDemandData' operation. It returns an mx.rpc.AsyncToken whose 
      * result property will be populated with the result of the operation when the server response is received. 
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function getDemandData(countryIDs:Object, scenarioID:int, deviceID:int, typeID:int, pwrID:int, isRegion:int, showAtDeviceLevel:int) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("getDemandData");
        var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(countryIDs,scenarioID,deviceID,typeID,pwrID,isRegion,showAtDeviceLevel) ;

        return _internal_token;
    }
     
    /**
      * This method is a generated wrapper used to call the 'getDeviceBase' operation. It returns an mx.rpc.AsyncToken whose 
      * result property will be populated with the result of the operation when the server response is received. 
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function getDeviceBase(countryIDs:Object, scenarioID:Object, pwrType:Object, showAtDeviceLevel:Object, deviceID:Object) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("getDeviceBase");
        var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(countryIDs,scenarioID,pwrType,showAtDeviceLevel,deviceID) ;

        return _internal_token;
    }
     
    /**
      * This method is a generated wrapper used to call the 'getDemandByChemistry' operation. It returns an mx.rpc.AsyncToken whose 
      * result property will be populated with the result of the operation when the server response is received. 
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function getDemandByChemistry(countryIDs:Object, scenarioID:Object, isRegion:Object) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("getDemandByChemistry");
        var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(countryIDs,scenarioID,isRegion) ;

        return _internal_token;
    }
     
}

}
