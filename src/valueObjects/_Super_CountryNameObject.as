/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - CountryNameObject.as.
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
public class _Super_CountryNameObject extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void
    {
    }

    model_internal static function initRemoteClassAliasAllRelated() : void
    {
    }

    model_internal var _dminternal_model : _CountryNameObjectEntityMetadata;

    /**
     * properties
     */
    private var _internal_region : int;
    private var _internal_id : int;
    private var _internal_pwr_RCR : int;
    private var _internal_segment1 : int;
    private var _internal_battery_size : int;
    private var _internal_segment2 : int;
    private var _internal_avg_number : int;
    private var _internal_isRegion : int;
    private var _internal_pwr_DPP : int;
    private var _internal_shortName : Object;
    private var _internal_namen : String;

    private static var emptyArray:Array = new Array();


    /**
     * derived property cache initialization
     */
    model_internal var _cacheInitialized_isValid:Boolean = false;

    model_internal var _changeWatcherArray:Array = new Array();

    public function _Super_CountryNameObject()
    {
        _model = new _CountryNameObjectEntityMetadata(this);

        // Bind to own data properties for cache invalidation triggering
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "shortName", model_internal::setterListenerShortName));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "namen", model_internal::setterListenerNamen));

    }

    /**
     * data property getters
     */

    [Bindable(event="propertyChange")]
    public function get region() : int
    {
        return _internal_region;
    }

    [Bindable(event="propertyChange")]
    public function get id() : int
    {
        return _internal_id;
    }

    [Bindable(event="propertyChange")]
    public function get pwr_RCR() : int
    {
        return _internal_pwr_RCR;
    }

    [Bindable(event="propertyChange")]
    public function get segment1() : int
    {
        return _internal_segment1;
    }

    [Bindable(event="propertyChange")]
    public function get battery_size() : int
    {
        return _internal_battery_size;
    }

    [Bindable(event="propertyChange")]
    public function get segment2() : int
    {
        return _internal_segment2;
    }

    [Bindable(event="propertyChange")]
    public function get avg_number() : int
    {
        return _internal_avg_number;
    }

    [Bindable(event="propertyChange")]
    public function get isRegion() : int
    {
        return _internal_isRegion;
    }

    [Bindable(event="propertyChange")]
    public function get pwr_DPP() : int
    {
        return _internal_pwr_DPP;
    }

    [Bindable(event="propertyChange")]
    public function get shortName() : Object
    {
        return _internal_shortName;
    }

    [Bindable(event="propertyChange")]
    public function get namen() : String
    {
        return _internal_namen;
    }

    /**
     * data property setters
     */

    public function set region(value:int) : void
    {
        var oldValue:int = _internal_region;
        if (oldValue !== value)
        {
            _internal_region = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "region", oldValue, _internal_region));
        }
    }

    public function set id(value:int) : void
    {
        var oldValue:int = _internal_id;
        if (oldValue !== value)
        {
            _internal_id = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "id", oldValue, _internal_id));
        }
    }

    public function set pwr_RCR(value:int) : void
    {
        var oldValue:int = _internal_pwr_RCR;
        if (oldValue !== value)
        {
            _internal_pwr_RCR = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "pwr_RCR", oldValue, _internal_pwr_RCR));
        }
    }

    public function set segment1(value:int) : void
    {
        var oldValue:int = _internal_segment1;
        if (oldValue !== value)
        {
            _internal_segment1 = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "segment1", oldValue, _internal_segment1));
        }
    }

    public function set battery_size(value:int) : void
    {
        var oldValue:int = _internal_battery_size;
        if (oldValue !== value)
        {
            _internal_battery_size = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "battery_size", oldValue, _internal_battery_size));
        }
    }

    public function set segment2(value:int) : void
    {
        var oldValue:int = _internal_segment2;
        if (oldValue !== value)
        {
            _internal_segment2 = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "segment2", oldValue, _internal_segment2));
        }
    }

    public function set avg_number(value:int) : void
    {
        var oldValue:int = _internal_avg_number;
        if (oldValue !== value)
        {
            _internal_avg_number = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "avg_number", oldValue, _internal_avg_number));
        }
    }

    public function set isRegion(value:int) : void
    {
        var oldValue:int = _internal_isRegion;
        if (oldValue !== value)
        {
            _internal_isRegion = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "isRegion", oldValue, _internal_isRegion));
        }
    }

    public function set pwr_DPP(value:int) : void
    {
        var oldValue:int = _internal_pwr_DPP;
        if (oldValue !== value)
        {
            _internal_pwr_DPP = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "pwr_DPP", oldValue, _internal_pwr_DPP));
        }
    }

    public function set shortName(value:Object) : void
    {
        var oldValue:Object = _internal_shortName;
        if (oldValue !== value)
        {
            _internal_shortName = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "shortName", oldValue, _internal_shortName));
        }
    }

    public function set namen(value:String) : void
    {
        var oldValue:String = _internal_namen;
        if (oldValue !== value)
        {
            _internal_namen = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "namen", oldValue, _internal_namen));
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

    model_internal function setterListenerShortName(value:flash.events.Event):void
    {
        _model.invalidateDependentOnShortName();
    }

    model_internal function setterListenerNamen(value:flash.events.Event):void
    {
        _model.invalidateDependentOnNamen();
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
        if (!_model.shortNameIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_shortNameValidationFailureMessages);
        }
        if (!_model.namenIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_namenValidationFailureMessages);
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
    public function get _model() : _CountryNameObjectEntityMetadata
    {
        return model_internal::_dminternal_model;
    }

    public function set _model(value : _CountryNameObjectEntityMetadata) : void
    {
        var oldValue : _CountryNameObjectEntityMetadata = model_internal::_dminternal_model;
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

    model_internal var _doValidationCacheOfShortName : Array = null;
    model_internal var _doValidationLastValOfShortName : Object;

    model_internal function _doValidationForShortName(valueIn:Object):Array
    {
        var value : Object = valueIn as Object;

        if (model_internal::_doValidationCacheOfShortName != null && model_internal::_doValidationLastValOfShortName == value)
           return model_internal::_doValidationCacheOfShortName ;

        _model.model_internal::_shortNameIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isShortNameAvailable && _internal_shortName == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "shortName is required"));
        }

        model_internal::_doValidationCacheOfShortName = validationFailures;
        model_internal::_doValidationLastValOfShortName = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfNamen : Array = null;
    model_internal var _doValidationLastValOfNamen : String;

    model_internal function _doValidationForNamen(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfNamen != null && model_internal::_doValidationLastValOfNamen == value)
           return model_internal::_doValidationCacheOfNamen ;

        _model.model_internal::_namenIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isNamenAvailable && _internal_namen == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "namen is required"));
        }

        model_internal::_doValidationCacheOfNamen = validationFailures;
        model_internal::_doValidationLastValOfNamen = value;

        return validationFailures;
    }
    

}

}
