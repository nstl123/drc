/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - CustomDatatype1.as.
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
public class _Super_CustomDatatype1 extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void
    {
    }

    model_internal static function initRemoteClassAliasAllRelated() : void
    {
    }

    model_internal var _dminternal_model : _CustomDatatype1EntityMetadata;

    /**
     * properties
     */
    private var _internal_indicatorID : String;
    private var _internal_sessionID : String;
    private var _internal_scenarioID : String;
    private var _internal_countryID : String;
    private var _internal_Y2005 : String;
    private var _internal_unitID : String;
    private var _internal_Y2010 : String;

    private static var emptyArray:Array = new Array();


    /**
     * derived property cache initialization
     */
    model_internal var _cacheInitialized_isValid:Boolean = false;

    model_internal var _changeWatcherArray:Array = new Array();

    public function _Super_CustomDatatype1()
    {
        _model = new _CustomDatatype1EntityMetadata(this);

        // Bind to own data properties for cache invalidation triggering
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "indicatorID", model_internal::setterListenerIndicatorID));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "sessionID", model_internal::setterListenerSessionID));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "scenarioID", model_internal::setterListenerScenarioID));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "countryID", model_internal::setterListenerCountryID));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "Y2005", model_internal::setterListenerY2005));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "unitID", model_internal::setterListenerUnitID));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "Y2010", model_internal::setterListenerY2010));

    }

    /**
     * data property getters
     */

    [Bindable(event="propertyChange")]
    public function get indicatorID() : String
    {
        return _internal_indicatorID;
    }

    [Bindable(event="propertyChange")]
    public function get sessionID() : String
    {
        return _internal_sessionID;
    }

    [Bindable(event="propertyChange")]
    public function get scenarioID() : String
    {
        return _internal_scenarioID;
    }

    [Bindable(event="propertyChange")]
    public function get countryID() : String
    {
        return _internal_countryID;
    }

    [Bindable(event="propertyChange")]
    public function get Y2005() : String
    {
        return _internal_Y2005;
    }

    [Bindable(event="propertyChange")]
    public function get unitID() : String
    {
        return _internal_unitID;
    }

    [Bindable(event="propertyChange")]
    public function get Y2010() : String
    {
        return _internal_Y2010;
    }

    /**
     * data property setters
     */

    public function set indicatorID(value:String) : void
    {
        var oldValue:String = _internal_indicatorID;
        if (oldValue !== value)
        {
            _internal_indicatorID = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "indicatorID", oldValue, _internal_indicatorID));
        }
    }

    public function set sessionID(value:String) : void
    {
        var oldValue:String = _internal_sessionID;
        if (oldValue !== value)
        {
            _internal_sessionID = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "sessionID", oldValue, _internal_sessionID));
        }
    }

    public function set scenarioID(value:String) : void
    {
        var oldValue:String = _internal_scenarioID;
        if (oldValue !== value)
        {
            _internal_scenarioID = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "scenarioID", oldValue, _internal_scenarioID));
        }
    }

    public function set countryID(value:String) : void
    {
        var oldValue:String = _internal_countryID;
        if (oldValue !== value)
        {
            _internal_countryID = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "countryID", oldValue, _internal_countryID));
        }
    }

    public function set Y2005(value:String) : void
    {
        var oldValue:String = _internal_Y2005;
        if (oldValue !== value)
        {
            _internal_Y2005 = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Y2005", oldValue, _internal_Y2005));
        }
    }

    public function set unitID(value:String) : void
    {
        var oldValue:String = _internal_unitID;
        if (oldValue !== value)
        {
            _internal_unitID = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "unitID", oldValue, _internal_unitID));
        }
    }

    public function set Y2010(value:String) : void
    {
        var oldValue:String = _internal_Y2010;
        if (oldValue !== value)
        {
            _internal_Y2010 = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Y2010", oldValue, _internal_Y2010));
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

    model_internal function setterListenerIndicatorID(value:flash.events.Event):void
    {
        _model.invalidateDependentOnIndicatorID();
    }

    model_internal function setterListenerSessionID(value:flash.events.Event):void
    {
        _model.invalidateDependentOnSessionID();
    }

    model_internal function setterListenerScenarioID(value:flash.events.Event):void
    {
        _model.invalidateDependentOnScenarioID();
    }

    model_internal function setterListenerCountryID(value:flash.events.Event):void
    {
        _model.invalidateDependentOnCountryID();
    }

    model_internal function setterListenerY2005(value:flash.events.Event):void
    {
        _model.invalidateDependentOnY2005();
    }

    model_internal function setterListenerUnitID(value:flash.events.Event):void
    {
        _model.invalidateDependentOnUnitID();
    }

    model_internal function setterListenerY2010(value:flash.events.Event):void
    {
        _model.invalidateDependentOnY2010();
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
        if (!_model.indicatorIDIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_indicatorIDValidationFailureMessages);
        }
        if (!_model.sessionIDIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_sessionIDValidationFailureMessages);
        }
        if (!_model.scenarioIDIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_scenarioIDValidationFailureMessages);
        }
        if (!_model.countryIDIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_countryIDValidationFailureMessages);
        }
        if (!_model.Y2005IsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_Y2005ValidationFailureMessages);
        }
        if (!_model.unitIDIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_unitIDValidationFailureMessages);
        }
        if (!_model.Y2010IsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_Y2010ValidationFailureMessages);
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
    public function get _model() : _CustomDatatype1EntityMetadata
    {
        return model_internal::_dminternal_model;
    }

    public function set _model(value : _CustomDatatype1EntityMetadata) : void
    {
        var oldValue : _CustomDatatype1EntityMetadata = model_internal::_dminternal_model;
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

    model_internal var _doValidationCacheOfIndicatorID : Array = null;
    model_internal var _doValidationLastValOfIndicatorID : String;

    model_internal function _doValidationForIndicatorID(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfIndicatorID != null && model_internal::_doValidationLastValOfIndicatorID == value)
           return model_internal::_doValidationCacheOfIndicatorID ;

        _model.model_internal::_indicatorIDIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isIndicatorIDAvailable && _internal_indicatorID == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "indicatorID is required"));
        }

        model_internal::_doValidationCacheOfIndicatorID = validationFailures;
        model_internal::_doValidationLastValOfIndicatorID = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfSessionID : Array = null;
    model_internal var _doValidationLastValOfSessionID : String;

    model_internal function _doValidationForSessionID(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfSessionID != null && model_internal::_doValidationLastValOfSessionID == value)
           return model_internal::_doValidationCacheOfSessionID ;

        _model.model_internal::_sessionIDIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isSessionIDAvailable && _internal_sessionID == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "sessionID is required"));
        }

        model_internal::_doValidationCacheOfSessionID = validationFailures;
        model_internal::_doValidationLastValOfSessionID = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfScenarioID : Array = null;
    model_internal var _doValidationLastValOfScenarioID : String;

    model_internal function _doValidationForScenarioID(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfScenarioID != null && model_internal::_doValidationLastValOfScenarioID == value)
           return model_internal::_doValidationCacheOfScenarioID ;

        _model.model_internal::_scenarioIDIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isScenarioIDAvailable && _internal_scenarioID == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "scenarioID is required"));
        }

        model_internal::_doValidationCacheOfScenarioID = validationFailures;
        model_internal::_doValidationLastValOfScenarioID = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfCountryID : Array = null;
    model_internal var _doValidationLastValOfCountryID : String;

    model_internal function _doValidationForCountryID(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfCountryID != null && model_internal::_doValidationLastValOfCountryID == value)
           return model_internal::_doValidationCacheOfCountryID ;

        _model.model_internal::_countryIDIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isCountryIDAvailable && _internal_countryID == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "countryID is required"));
        }

        model_internal::_doValidationCacheOfCountryID = validationFailures;
        model_internal::_doValidationLastValOfCountryID = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfY2005 : Array = null;
    model_internal var _doValidationLastValOfY2005 : String;

    model_internal function _doValidationForY2005(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfY2005 != null && model_internal::_doValidationLastValOfY2005 == value)
           return model_internal::_doValidationCacheOfY2005 ;

        _model.model_internal::_Y2005IsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isY2005Available && _internal_Y2005 == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "Y2005 is required"));
        }

        model_internal::_doValidationCacheOfY2005 = validationFailures;
        model_internal::_doValidationLastValOfY2005 = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfUnitID : Array = null;
    model_internal var _doValidationLastValOfUnitID : String;

    model_internal function _doValidationForUnitID(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfUnitID != null && model_internal::_doValidationLastValOfUnitID == value)
           return model_internal::_doValidationCacheOfUnitID ;

        _model.model_internal::_unitIDIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isUnitIDAvailable && _internal_unitID == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "unitID is required"));
        }

        model_internal::_doValidationCacheOfUnitID = validationFailures;
        model_internal::_doValidationLastValOfUnitID = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfY2010 : Array = null;
    model_internal var _doValidationLastValOfY2010 : String;

    model_internal function _doValidationForY2010(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfY2010 != null && model_internal::_doValidationLastValOfY2010 == value)
           return model_internal::_doValidationCacheOfY2010 ;

        _model.model_internal::_Y2010IsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isY2010Available && _internal_Y2010 == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "Y2010 is required"));
        }

        model_internal::_doValidationCacheOfY2010 = validationFailures;
        model_internal::_doValidationLastValOfY2010 = value;

        return validationFailures;
    }
    

}

}
