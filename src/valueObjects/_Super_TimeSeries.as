/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - TimeSeries.as.
 */

package valueObjects
{
import com.adobe.fiber.services.IFiberManagingService;
import com.adobe.fiber.valueobjects.IValueObject;
import flash.events.EventDispatcher;
import mx.events.PropertyChangeEvent;

import flash.net.registerClassAlias;
import flash.net.getClassByAlias;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;

use namespace model_internal;

[ExcludeClass]
public class _Super_TimeSeries extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void
    {
    }

    model_internal static function initRemoteClassAliasAllRelated() : void
    {
    }

    model_internal var _dminternal_model : _TimeSeriesEntityMetadata;

    /**
     * properties
     */
    private var _internal_indicatorID : int;
    private var _internal_sessionID : int;
    private var _internal_countryID : int;
    private var _internal_scenarioID : int;
    private var _internal_Y2005 : Number;
    private var _internal_unitID : int;
    private var _internal_Y2010 : Number;

    private static var emptyArray:Array = new Array();

    // Change this value according to your application's floating-point precision
    private static var epsilon:Number = 0.0001;

    /**
     * derived property cache initialization
     */
    model_internal var _cacheInitialized_isValid:Boolean = false;

    model_internal var _changeWatcherArray:Array = new Array();

    public function _Super_TimeSeries()
    {
        _model = new _TimeSeriesEntityMetadata(this);

        // Bind to own data properties for cache invalidation triggering

    }

    /**
     * data property getters
     */

    [Bindable(event="propertyChange")]
    public function get indicatorID() : int
    {
        return _internal_indicatorID;
    }

    [Bindable(event="propertyChange")]
    public function get sessionID() : int
    {
        return _internal_sessionID;
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
    public function get unitID() : int
    {
        return _internal_unitID;
    }

    [Bindable(event="propertyChange")]
    public function get Y2010() : Number
    {
        return _internal_Y2010;
    }

    /**
     * data property setters
     */

    public function set indicatorID(value:int) : void
    {
        var oldValue:int = _internal_indicatorID;
        if (oldValue !== value)
        {
            _internal_indicatorID = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "indicatorID", oldValue, _internal_indicatorID));
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

    public function set unitID(value:int) : void
    {
        var oldValue:int = _internal_unitID;
        if (oldValue !== value)
        {
            _internal_unitID = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "unitID", oldValue, _internal_unitID));
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
    public function get _model() : _TimeSeriesEntityMetadata
    {
        return model_internal::_dminternal_model;
    }

    public function set _model(value : _TimeSeriesEntityMetadata) : void
    {
        var oldValue : _TimeSeriesEntityMetadata = model_internal::_dminternal_model;
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


}

}
