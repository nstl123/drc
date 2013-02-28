/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - G.as.
 */

package valueObjects
{
import com.adobe.fiber.services.IFiberManagingService;
import com.adobe.fiber.util.FiberUtils;
import com.adobe.fiber.valueobjects.IValueObject;
import flash.events.Event;
import flash.events.EventDispatcher;
import mx.binding.utils.ChangeWatcher;
import mx.events.PropertyChangeEvent;
import mx.validators.ValidationResult;

import flash.net.registerClassAlias;
import flash.net.getClassByAlias;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;

use namespace model_internal;

[ExcludeClass]
public class _Super_G extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void
    {
    }

    model_internal static function initRemoteClassAliasAllRelated() : void
    {
    }

    model_internal var _dminternal_model : _GEntityMetadata;

    /**
     * properties
     */
    private var _internal_Y2004 : Number;
    private var _internal_indicatorID : int;
    private var _internal_pwrTypeID : int;
    private var _internal_indiName : String;
    private var _internal_sessionID : int;
    private var _internal_Y2006 : Number;
    private var _internal_countryID : int;
    private var _internal_scenarioID : int;
    private var _internal_Y2005 : Number;
    private var _internal_deviceID : int;
    private var _internal_cntryName : String;
    private var _internal_batTypeID : int;

    private static var emptyArray:Array = new Array();

    // Change this value according to your application's floating-point precision
    private static var epsilon:Number = 0.0001;

    /**
     * derived property cache initialization
     */
    model_internal var _cacheInitialized_isValid:Boolean = false;

    model_internal var _changeWatcherArray:Array = new Array();

    public function _Super_G()
    {
        _model = new _GEntityMetadata(this);

        // Bind to own data properties for cache invalidation triggering
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "indiName", model_internal::setterListenerIndiName));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "cntryName", model_internal::setterListenerCntryName));

    }

    /**
     * data property getters
     */

    [Bindable(event="propertyChange")]
    public function get Y2004() : Number
    {
        return _internal_Y2004;
    }

    [Bindable(event="propertyChange")]
    public function get indicatorID() : int
    {
        return _internal_indicatorID;
    }

    [Bindable(event="propertyChange")]
    public function get pwrTypeID() : int
    {
        return _internal_pwrTypeID;
    }

    [Bindable(event="propertyChange")]
    public function get indiName() : String
    {
        return _internal_indiName;
    }

    [Bindable(event="propertyChange")]
    public function get sessionID() : int
    {
        return _internal_sessionID;
    }

    [Bindable(event="propertyChange")]
    public function get Y2006() : Number
    {
        return _internal_Y2006;
    }

    [Bindable(event="propertyChange")]
    public function get countryID() : int
    {
        return _internal_countryID;
    }

    [Bindable(event="propertyChange")]
    public function get scenarioID() : int
    {
        return _internal_scenarioID;
    }

    [Bindable(event="propertyChange")]
    public function get Y2005() : Number
    {
        return _internal_Y2005;
    }

    [Bindable(event="propertyChange")]
    public function get deviceID() : int
    {
        return _internal_deviceID;
    }

    [Bindable(event="propertyChange")]
    public function get cntryName() : String
    {
        return _internal_cntryName;
    }

    [Bindable(event="propertyChange")]
    public function get batTypeID() : int
    {
        return _internal_batTypeID;
    }

    /**
     * data property setters
     */

    public function set Y2004(value:Number) : void
    {
        var oldValue:Number = _internal_Y2004;
        if (isNaN(_internal_Y2004) == true || Math.abs(oldValue - value) > epsilon)
        {
            _internal_Y2004 = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Y2004", oldValue, _internal_Y2004));
        }
    }

    public function set indicatorID(value:int) : void
    {
        var oldValue:int = _internal_indicatorID;
        if (oldValue !== value)
        {
            _internal_indicatorID = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "indicatorID", oldValue, _internal_indicatorID));
        }
    }

    public function set pwrTypeID(value:int) : void
    {
        var oldValue:int = _internal_pwrTypeID;
        if (oldValue !== value)
        {
            _internal_pwrTypeID = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "pwrTypeID", oldValue, _internal_pwrTypeID));
        }
    }

    public function set indiName(value:String) : void
    {
        var oldValue:String = _internal_indiName;
        if (oldValue !== value)
        {
            _internal_indiName = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "indiName", oldValue, _internal_indiName));
        }
    }

    public function set sessionID(value:int) : void
    {
        var oldValue:int = _internal_sessionID;
        if (oldValue !== value)
        {
            _internal_sessionID = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "sessionID", oldValue, _internal_sessionID));
        }
    }

    public function set Y2006(value:Number) : void
    {
        var oldValue:Number = _internal_Y2006;
        if (isNaN(_internal_Y2006) == true || Math.abs(oldValue - value) > epsilon)
        {
            _internal_Y2006 = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Y2006", oldValue, _internal_Y2006));
        }
    }

    public function set countryID(value:int) : void
    {
        var oldValue:int = _internal_countryID;
        if (oldValue !== value)
        {
            _internal_countryID = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "countryID", oldValue, _internal_countryID));
        }
    }

    public function set scenarioID(value:int) : void
    {
        var oldValue:int = _internal_scenarioID;
        if (oldValue !== value)
        {
            _internal_scenarioID = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "scenarioID", oldValue, _internal_scenarioID));
        }
    }

    public function set Y2005(value:Number) : void
    {
        var oldValue:Number = _internal_Y2005;
        if (isNaN(_internal_Y2005) == true || Math.abs(oldValue - value) > epsilon)
        {
            _internal_Y2005 = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Y2005", oldValue, _internal_Y2005));
        }
    }

    public function set deviceID(value:int) : void
    {
        var oldValue:int = _internal_deviceID;
        if (oldValue !== value)
        {
            _internal_deviceID = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "deviceID", oldValue, _internal_deviceID));
        }
    }

    public function set cntryName(value:String) : void
    {
        var oldValue:String = _internal_cntryName;
        if (oldValue !== value)
        {
            _internal_cntryName = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "cntryName", oldValue, _internal_cntryName));
        }
    }

    public function set batTypeID(value:int) : void
    {
        var oldValue:int = _internal_batTypeID;
        if (oldValue !== value)
        {
            _internal_batTypeID = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "batTypeID", oldValue, _internal_batTypeID));
        }
    }

    /**
     * Data property setter listeners
     *
     * Each data property whose value affects other properties or the validity of the entity
     * needs to invalidate all previously calculated artifacts. These include:
     *  - any derived properties or constraints that reference the given data property.
     *  - any availability guards (variant expressions) that reference the given data property.
     *  - any style validations, message tokens or guards that reference the given data property.
     *  - the validity of the property (and the containing entity) if the given data property has a length restriction.
     *  - the validity of the property (and the containing entity) if the given data property is required.
     */

    model_internal function setterListenerIndiName(value:flash.events.Event):void
    {
        _model.invalidateDependentOnIndiName();
    }

    model_internal function setterListenerCntryName(value:flash.events.Event):void
    {
        _model.invalidateDependentOnCntryName();
    }


    /**
     * valid related derived properties
     */
    model_internal var _isValid : Boolean;
    model_internal var _invalidConstraints:Array = new Array();
    model_internal var _validationFailureMessages:Array = new Array();

    /**
     * derived property calculators
     */

    /**
     * isValid calculator
     */
    model_internal function calculateIsValid():Boolean
    {
        var violatedConsts:Array = new Array();
        var validationFailureMessages:Array = new Array();

        var propertyValidity:Boolean = true;
        if (!_model.indiNameIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_indiNameValidationFailureMessages);
        }
        if (!_model.cntryNameIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_cntryNameValidationFailureMessages);
        }

        model_internal::_cacheInitialized_isValid = true;
        model_internal::invalidConstraints_der = violatedConsts;
        model_internal::validationFailureMessages_der = validationFailureMessages;
        return violatedConsts.length == 0 && propertyValidity;
    }

    /**
     * derived property setters
     */

    model_internal function set isValid_der(value:Boolean) : void
    {
        var oldValue:Boolean = model_internal::_isValid;
        if (oldValue !== value)
        {
            model_internal::_isValid = value;
            _model.model_internal::fireChangeEvent("isValid", oldValue, model_internal::_isValid);
        }
    }

    /**
     * derived property getters
     */

    [Transient]
    [Bindable(event="propertyChange")]
    public function get _model() : _GEntityMetadata
    {
        return model_internal::_dminternal_model;
    }

    public function set _model(value : _GEntityMetadata) : void
    {
        var oldValue : _GEntityMetadata = model_internal::_dminternal_model;
        if (oldValue !== value)
        {
            model_internal::_dminternal_model = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_model", oldValue, model_internal::_dminternal_model));
        }
    }

    /**
     * methods
     */


    /**
     *  services
     */
    private var _managingService:com.adobe.fiber.services.IFiberManagingService;

    public function set managingService(managingService:com.adobe.fiber.services.IFiberManagingService):void
    {
        _managingService = managingService;
    }

    model_internal function set invalidConstraints_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_invalidConstraints;
        // avoid firing the event when old and new value are different empty arrays
        if (oldValue !== value && (oldValue.length > 0 || value.length > 0))
        {
            model_internal::_invalidConstraints = value;
            _model.model_internal::fireChangeEvent("invalidConstraints", oldValue, model_internal::_invalidConstraints);
        }
    }

    model_internal function set validationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_validationFailureMessages;
        // avoid firing the event when old and new value are different empty arrays
        if (oldValue !== value && (oldValue.length > 0 || value.length > 0))
        {
            model_internal::_validationFailureMessages = value;
            _model.model_internal::fireChangeEvent("validationFailureMessages", oldValue, model_internal::_validationFailureMessages);
        }
    }

    model_internal var _doValidationCacheOfIndiName : Array = null;
    model_internal var _doValidationLastValOfIndiName : String;

    model_internal function _doValidationForIndiName(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfIndiName != null && model_internal::_doValidationLastValOfIndiName == value)
           return model_internal::_doValidationCacheOfIndiName ;

        _model.model_internal::_indiNameIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isIndiNameAvailable && _internal_indiName == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "indiName is required"));
        }

        model_internal::_doValidationCacheOfIndiName = validationFailures;
        model_internal::_doValidationLastValOfIndiName = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfCntryName : Array = null;
    model_internal var _doValidationLastValOfCntryName : String;

    model_internal function _doValidationForCntryName(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfCntryName != null && model_internal::_doValidationLastValOfCntryName == value)
           return model_internal::_doValidationCacheOfCntryName ;

        _model.model_internal::_cntryNameIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isCntryNameAvailable && _internal_cntryName == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "cntryName is required"));
        }

        model_internal::_doValidationCacheOfCntryName = validationFailures;
        model_internal::_doValidationLastValOfCntryName = value;

        return validationFailures;
    }
    

}

}