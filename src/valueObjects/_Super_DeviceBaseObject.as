/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - DeviceBaseObject.as.
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
public class _Super_DeviceBaseObject extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void
    {
    }

    model_internal static function initRemoteClassAliasAllRelated() : void
    {
    }

    model_internal var _dminternal_model : _DeviceBaseObjectEntityMetadata;

    /**
     * properties
     */
    private var _internal_Y2004 : Number = Number(0);
    private var _internal_Y2012 : Number = Number(0);
    private var _internal_indicatorID : int;
    private var _internal_countryName : String;
    private var _internal_Y2008 : Number = Number(0);
    private var _internal_Y2007 : Number = Number(0);
    private var _internal_countryID : int;
    private var _internal_Y2006 : Number = Number(0);
    private var _internal_deviceID : int;
    private var _internal_Y2005 : Number = Number(0);
    private var _internal_Y2010 : Number = Number(0);
    private var _internal_sessionID : int;
    private var _internal_deviceName : String;
    private var _internal_scenarioID : int;
    private var _internal_Y2009 : Number = Number(0);

    private static var emptyArray:Array = new Array();

    // Change this value according to your application's floating-point precision
    private static var epsilon:Number = 0.0001;

    /**
     * derived property cache initialization
     */
    model_internal var _cacheInitialized_isValid:Boolean = false;

    model_internal var _changeWatcherArray:Array = new Array();

    public function _Super_DeviceBaseObject()
    {
        _model = new _DeviceBaseObjectEntityMetadata(this);

        // Bind to own data properties for cache invalidation triggering
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "countryName", model_internal::setterListenerCountryName));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "deviceName", model_internal::setterListenerDeviceName));

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
    public function get Y2012() : Number
    {
        return _internal_Y2012;
    }

    [Bindable(event="propertyChange")]
    public function get indicatorID() : int
    {
        return _internal_indicatorID;
    }

    [Bindable(event="propertyChange")]
    public function get countryName() : String
    {
        return _internal_countryName;
    }

    [Bindable(event="propertyChange")]
    public function get Y2008() : Number
    {
        return _internal_Y2008;
    }

    [Bindable(event="propertyChange")]
    public function get Y2007() : Number
    {
        return _internal_Y2007;
    }

    [Bindable(event="propertyChange")]
    public function get countryID() : int
    {
        return _internal_countryID;
    }

    [Bindable(event="propertyChange")]
    public function get Y2006() : Number
    {
        return _internal_Y2006;
    }

    [Bindable(event="propertyChange")]
    public function get deviceID() : int
    {
        return _internal_deviceID;
    }

    [Bindable(event="propertyChange")]
    public function get Y2005() : Number
    {
        return _internal_Y2005;
    }

    [Bindable(event="propertyChange")]
    public function get Y2010() : Number
    {
        return _internal_Y2010;
    }

    [Bindable(event="propertyChange")]
    public function get sessionID() : int
    {
        return _internal_sessionID;
    }

    [Bindable(event="propertyChange")]
    public function get deviceName() : String
    {
        return _internal_deviceName;
    }

    [Bindable(event="propertyChange")]
    public function get scenarioID() : int
    {
        return _internal_scenarioID;
    }

    [Bindable(event="propertyChange")]
    public function get Y2009() : Number
    {
        return _internal_Y2009;
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

    public function set Y2012(value:Number) : void
    {
        var oldValue:Number = _internal_Y2012;
        if (isNaN(_internal_Y2012) == true || Math.abs(oldValue - value) > epsilon)
        {
            _internal_Y2012 = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Y2012", oldValue, _internal_Y2012));
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

    public function set countryName(value:String) : void
    {
        var oldValue:String = _internal_countryName;
        if (oldValue !== value)
        {
            _internal_countryName = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "countryName", oldValue, _internal_countryName));
        }
    }

    public function set Y2008(value:Number) : void
    {
        var oldValue:Number = _internal_Y2008;
        if (isNaN(_internal_Y2008) == true || Math.abs(oldValue - value) > epsilon)
        {
            _internal_Y2008 = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Y2008", oldValue, _internal_Y2008));
        }
    }

    public function set Y2007(value:Number) : void
    {
        var oldValue:Number = _internal_Y2007;
        if (isNaN(_internal_Y2007) == true || Math.abs(oldValue - value) > epsilon)
        {
            _internal_Y2007 = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Y2007", oldValue, _internal_Y2007));
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

    public function set Y2006(value:Number) : void
    {
        var oldValue:Number = _internal_Y2006;
        if (isNaN(_internal_Y2006) == true || Math.abs(oldValue - value) > epsilon)
        {
            _internal_Y2006 = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Y2006", oldValue, _internal_Y2006));
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

    public function set Y2005(value:Number) : void
    {
        var oldValue:Number = _internal_Y2005;
        if (isNaN(_internal_Y2005) == true || Math.abs(oldValue - value) > epsilon)
        {
            _internal_Y2005 = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Y2005", oldValue, _internal_Y2005));
        }
    }

    public function set Y2010(value:Number) : void
    {
        var oldValue:Number = _internal_Y2010;
        if (isNaN(_internal_Y2010) == true || Math.abs(oldValue - value) > epsilon)
        {
            _internal_Y2010 = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Y2010", oldValue, _internal_Y2010));
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

    public function set deviceName(value:String) : void
    {
        var oldValue:String = _internal_deviceName;
        if (oldValue !== value)
        {
            _internal_deviceName = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "deviceName", oldValue, _internal_deviceName));
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

    public function set Y2009(value:Number) : void
    {
        var oldValue:Number = _internal_Y2009;
        if (isNaN(_internal_Y2009) == true || Math.abs(oldValue - value) > epsilon)
        {
            _internal_Y2009 = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Y2009", oldValue, _internal_Y2009));
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

    model_internal function setterListenerCountryName(value:flash.events.Event):void
    {
        _model.invalidateDependentOnCountryName();
    }

    model_internal function setterListenerDeviceName(value:flash.events.Event):void
    {
        _model.invalidateDependentOnDeviceName();
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
        if (!_model.countryNameIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_countryNameValidationFailureMessages);
        }
        if (!_model.deviceNameIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_deviceNameValidationFailureMessages);
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
    public function get _model() : _DeviceBaseObjectEntityMetadata
    {
        return model_internal::_dminternal_model;
    }

    public function set _model(value : _DeviceBaseObjectEntityMetadata) : void
    {
        var oldValue : _DeviceBaseObjectEntityMetadata = model_internal::_dminternal_model;
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

    model_internal var _doValidationCacheOfCountryName : Array = null;
    model_internal var _doValidationLastValOfCountryName : String;

    model_internal function _doValidationForCountryName(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfCountryName != null && model_internal::_doValidationLastValOfCountryName == value)
           return model_internal::_doValidationCacheOfCountryName ;

        _model.model_internal::_countryNameIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isCountryNameAvailable && _internal_countryName == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "countryName is required"));
        }

        model_internal::_doValidationCacheOfCountryName = validationFailures;
        model_internal::_doValidationLastValOfCountryName = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfDeviceName : Array = null;
    model_internal var _doValidationLastValOfDeviceName : String;

    model_internal function _doValidationForDeviceName(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfDeviceName != null && model_internal::_doValidationLastValOfDeviceName == value)
           return model_internal::_doValidationCacheOfDeviceName ;

        _model.model_internal::_deviceNameIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isDeviceNameAvailable && _internal_deviceName == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "deviceName is required"));
        }

        model_internal::_doValidationCacheOfDeviceName = validationFailures;
        model_internal::_doValidationLastValOfDeviceName = value;

        return validationFailures;
    }
    

}

}
