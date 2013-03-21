/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this service wrapper you may modify the generated sub-class of this class - Depot3.as.
 */
package services.depot3
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
internal class _Super_Depot3 extends com.adobe.fiber.services.wrapper.RemoteObjectServiceWrapper
{

    // Constructor
    public function _Super_Depot3()
    {
        // initialize service control
        _serviceControl = new mx.rpc.remoting.RemoteObject();

        // initialize RemoteClass alias for all entities returned by functions of this service

        var operations:Object = new Object();
        var operation:mx.rpc.remoting.Operation;

        operation = new mx.rpc.remoting.Operation(null, "createNewWorkingScenario");
         operation.resultType = Object;
        operations["createNewWorkingScenario"] = operation;
        operation = new mx.rpc.remoting.Operation(null, "deleteWorkingScenario");
         operation.resultType = Object;
        operations["deleteWorkingScenario"] = operation;
        operation = new mx.rpc.remoting.Operation(null, "insertWorkingScenario");
         operation.resultType = Object;
        operations["insertWorkingScenario"] = operation;
        operation = new mx.rpc.remoting.Operation(null, "updateData");
         operation.resultType = Object;
        operations["updateData"] = operation;
        operation = new mx.rpc.remoting.Operation(null, "deleteAllScenarios");
         operation.resultType = Object;
        operations["deleteAllScenarios"] = operation;

        _serviceControl.operations = operations;
        _serviceControl.convertResultHandler = com.adobe.serializers.utility.TypeUtility.convertResultHandler;
        _serviceControl.source = "Depot3";
        _serviceControl.endpoint = "gateway.php";
        destination = "Depot3";



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
    public function createNewWorkingScenario(scenarioID:Number) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("createNewWorkingScenario");
        var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(scenarioID) ;

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
    public function deleteWorkingScenario(scenarioID:Number) : mx.rpc.AsyncToken
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
    public function insertWorkingScenario(scenarioID:Number) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("insertWorkingScenario");
        var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(scenarioID) ;

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
    public function updateData(data:Object, hasSplit:Object) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("updateData");
        var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(data,hasSplit) ;

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
     
}

}
