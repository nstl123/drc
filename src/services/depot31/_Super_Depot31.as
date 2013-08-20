/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this service wrapper you may modify the generated sub-class of this class - Depot31.as.
 */
package services.depot31
{
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.services.wrapper.RemoteObjectServiceWrapper;
import com.adobe.serializers.utility.TypeUtility;
import mx.rpc.AbstractOperation;
import mx.rpc.AsyncToken;
import mx.rpc.remoting.Operation;
import mx.rpc.remoting.RemoteObject;

import mx.collections.ItemResponder;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;

[ExcludeClass]
internal class _Super_Depot31 extends com.adobe.fiber.services.wrapper.RemoteObjectServiceWrapper
{

    // Constructor
    public function _Super_Depot31()
    {
        // initialize service control
        _serviceControl = new mx.rpc.remoting.RemoteObject();

        // initialize RemoteClass alias for all entities returned by functions of this service

        var operations:Object = new Object();
        var operation:mx.rpc.remoting.Operation;

        operation = new mx.rpc.remoting.Operation(null, "createNewWorkingScenario");
         operation.resultType = Object;
        operations["createNewWorkingScenario"] = operation;
        operation = new mx.rpc.remoting.Operation(null, "deleteAllScenarios");
         operation.resultType = Object;
        operations["deleteAllScenarios"] = operation;
        operation = new mx.rpc.remoting.Operation(null, "deleteWorkingScenario");
         operation.resultType = Object;
        operations["deleteWorkingScenario"] = operation;
        operation = new mx.rpc.remoting.Operation(null, "insertWorkingScenario");
         operation.resultType = Object;
        operations["insertWorkingScenario"] = operation;
        operation = new mx.rpc.remoting.Operation(null, "writeViewToTable");
         operation.resultType = String;
        operations["writeViewToTable"] = operation;
        operation = new mx.rpc.remoting.Operation(null, "testFile");
         operation.resultType = Object;
        operations["testFile"] = operation;
        operation = new mx.rpc.remoting.Operation(null, "updateData2");
         operation.resultType = String;
        operations["updateData2"] = operation;
        operation = new mx.rpc.remoting.Operation(null, "insertReplacementRate");
         operation.resultType = Object;
        operations["insertReplacementRate"] = operation;
        operation = new mx.rpc.remoting.Operation(null, "recalcDeviceBase");
         operation.resultType = int;
        operations["recalcDeviceBase"] = operation;
        operation = new mx.rpc.remoting.Operation(null, "updateData");
         operation.resultType = Object;
        operations["updateData"] = operation;

        _serviceControl.operations = operations;
        _serviceControl.convertResultHandler = com.adobe.serializers.utility.TypeUtility.convertResultHandler;
        _serviceControl.source = "Depot31";
        _serviceControl.endpoint = "gateway.php";
        destination = "Depot31";



         model_internal::initialize();
    }

    /**
      * This method is a generated wrapper used to call the 'createNewWorkingScenario' operation. It returns an mx.rpc.AsyncToken whose 
      * result property will be populated with the result of the operation when the server response is received. 
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function createNewWorkingScenario(scenarioID:Object) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("createNewWorkingScenario");
        var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(scenarioID) ;

        return _internal_token;
    }
     
    /**
      * This method is a generated wrapper used to call the 'deleteAllScenarios' operation. It returns an mx.rpc.AsyncToken whose 
      * result property will be populated with the result of the operation when the server response is received. 
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function deleteAllScenarios() : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("deleteAllScenarios");
        var _internal_token:mx.rpc.AsyncToken = _internal_operation.send() ;

        return _internal_token;
    }
     
    /**
      * This method is a generated wrapper used to call the 'deleteWorkingScenario' operation. It returns an mx.rpc.AsyncToken whose 
      * result property will be populated with the result of the operation when the server response is received. 
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function deleteWorkingScenario(scenarioID:Object) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("deleteWorkingScenario");
        var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(scenarioID) ;

        return _internal_token;
    }
     
    /**
      * This method is a generated wrapper used to call the 'insertWorkingScenario' operation. It returns an mx.rpc.AsyncToken whose 
      * result property will be populated with the result of the operation when the server response is received. 
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function insertWorkingScenario(scenarioID:Object) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("insertWorkingScenario");
        var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(scenarioID) ;

        return _internal_token;
    }
     
    /**
      * This method is a generated wrapper used to call the 'writeViewToTable' operation. It returns an mx.rpc.AsyncToken whose 
      * result property will be populated with the result of the operation when the server response is received. 
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function writeViewToTable(scenarioID:int, isMarket:int, isMarketSize:int) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("writeViewToTable");
        var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(scenarioID,isMarket,isMarketSize) ;

        return _internal_token;
    }
     
    /**
      * This method is a generated wrapper used to call the 'testFile' operation. It returns an mx.rpc.AsyncToken whose 
      * result property will be populated with the result of the operation when the server response is received. 
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function testFile(a:Object) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("testFile");
        var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(a) ;

        return _internal_token;
    }
     
    /**
      * This method is a generated wrapper used to call the 'updateData2' operation. It returns an mx.rpc.AsyncToken whose 
      * result property will be populated with the result of the operation when the server response is received. 
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function updateData2(data:Object, isDeviceBase:int, deviceID:int, typeID:int, startYear:int, shockValue:int) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("updateData2");
        var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(data,isDeviceBase,deviceID,typeID,startYear,shockValue) ;

        return _internal_token;
    }
     
    /**
      * This method is a generated wrapper used to call the 'insertReplacementRate' operation. It returns an mx.rpc.AsyncToken whose 
      * result property will be populated with the result of the operation when the server response is received. 
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function insertReplacementRate(scenarioID:Object) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("insertReplacementRate");
        var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(scenarioID) ;

        return _internal_token;
    }
     
    /**
      * This method is a generated wrapper used to call the 'recalcDeviceBase' operation. It returns an mx.rpc.AsyncToken whose 
      * result property will be populated with the result of the operation when the server response is received. 
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function recalcDeviceBase(scenarioID:int, cntryList:String) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("recalcDeviceBase");
        var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(scenarioID,cntryList) ;

        return _internal_token;
    }
     
    /**
      * This method is a generated wrapper used to call the 'updateData' operation. It returns an mx.rpc.AsyncToken whose 
      * result property will be populated with the result of the operation when the server response is received. 
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function updateData(data:Object, deviceID:Object, typeID:Object) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("updateData");
        var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(data,deviceID,typeID) ;

        return _internal_token;
    }
     
}

}
