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
import valueObjects.CustomDatatype16;
import valueObjects.CustomDatatype17;
import valueObjects.CustomDatatype18;
import valueObjects.CustomDatatype19;
import valueObjects.CustomDatatype23;

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
        valueObjects.CustomDatatype18._initRemoteClassAlias();
        valueObjects.CountryName._initRemoteClassAlias();
        valueObjects.CustomDatatype16._initRemoteClassAlias();
        valueObjects.CustomDatatype17._initRemoteClassAlias();
        valueObjects.CustomDatatype19._initRemoteClassAlias();
        valueObjects.CustomDatatype23._initRemoteClassAlias();

        var operations:Object = new Object();
        var operation:mx.rpc.remoting.Operation;

        operation = new mx.rpc.remoting.Operation(null, "getMacroData");
         operation.resultElementType = valueObjects.CustomDatatype18;
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
         operation.resultElementType = valueObjects.CustomDatatype19;
        operations["getDemandByChemistry"] = operation;
        operation = new mx.rpc.remoting.Operation(null, "getMacroDataCategory");
         operation.resultElementType = valueObjects.CustomDatatype23;
        operations["getMacroDataCategory"] = operation;

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
    public function getDemandData(countryIDs:Object, scenarioID:Object, typeID:Object, pwrID:Object, isRegion:Object, showAtDeviceLevel:Object, perHH:Object) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("getDemandData");
        var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(countryIDs,scenarioID,typeID,pwrID,isRegion,showAtDeviceLevel,perHH) ;

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
    public function getDeviceBase(countryIDs:Object, scenarioID:Object, pwrType:Object, showAtDeviceLevel:Object, perHH:Object) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("getDeviceBase");
        var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(countryIDs,scenarioID,pwrType,showAtDeviceLevel,perHH) ;

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
    public function getDemandByChemistry(countryIDs:Object, scenarioID:Object, isRegion:Object, perHH:Object) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("getDemandByChemistry");
        var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(countryIDs,scenarioID,isRegion,perHH) ;

        return _internal_token;
    }
     
    /**
      * This method is a generated wrapper used to call the 'getMacroDataCategory' operation. It returns an mx.rpc.AsyncToken whose 
      * result property will be populated with the result of the operation when the server response is received. 
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function getMacroDataCategory(countryIDs:Object, indicatorID:Object, scenarioID:Object, hasSplit:Object, typeID:Object, wNames:Object) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("getMacroDataCategory");
        var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(countryIDs,indicatorID,scenarioID,hasSplit,typeID,wNames) ;

        return _internal_token;
    }
     
}

}
