/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - A.as.
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
public class _Super_A extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void
    {
    }

    model_internal static function initRemoteClassAliasAllRelated() : void
    {
    }

    model_internal var _dminternal_model : _AEntityMetadata;

    /**
     * properties
     */
    private var _internal_unit : Object;
    private var _internal_isOutputIndicator : int;
    private var _internal_hasSplitByDevices : int;
    private var _internal_hasSplitByTypes : int;
    private var _internal_hierarchy : Object;
    private var _internal_hasTimeSeries : int;
    private var _internal_comments : String;
    private var _internal_region : int;
    private var _internal_id : int;
    private var _internal_pwr_RCR : int;
    private var _internal_segment1 : int;
    private var _internal_battery_size : int;
    private var _internal_segment2 : int;
    private var _internal_avg_number : int;
    private var _internal_isRegion : int;
    private var _internal_pwr_DPP : int;
    private var _internal_shortName : String;
    private var _internal_namen : String;
    private var _internal_Y2013 : Number;
    private var _internal_Y2004 : Number;
    private var _internal_Y2012 : Number;
    private var _internal_pwrTypeID : int;
    private var _internal_indicatorID : int;
    private var _internal_Y2015 : Number;
    private var _internal_indiName : String;
    private var _internal_Y2014 : Number;
    private var _internal_Y2008 : Number;
    private var _internal_Y2007 : Number;
    private var _internal_countryID : int;
    private var _internal_Y2006 : Number;
    private var _internal_deviceID : int;
    private var _internal_Y2005 : Number;
    private var _internal_Y2011 : Number;
    private var _internal_Y2010 : Number;
    private var _internal_sessionID : int;
    private var _internal_scenarioID : int;
    private var _internal_Y2009 : Number;
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

    public function _Super_A()
    {
        _model = new _AEntityMetadata(this);

        // Bind to own data properties for cache invalidation triggering
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "unit", model_internal::setterListenerUnit));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "hierarchy", model_internal::setterListenerHierarchy));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "comments", model_internal::setterListenerComments));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "shortName", model_internal::setterListenerShortName));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "namen", model_internal::setterListenerNamen));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "indiName", model_internal::setterListenerIndiName));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "cntryName", model_internal::setterListenerCntryName));

    }

    /**
     * data property getters
     */

    [Bindable(event="propertyChange")]
    public function get unit() : Object
    {
        return _internal_unit;
    }

    [Bindable(event="propertyChange")]
    public function get isOutputIndicator() : int
    {
        return _internal_isOutputIndicator;
    }

    [Bindable(event="propertyChange")]
    public function get hasSplitByDevices() : int
    {
        return _internal_hasSplitByDevices;
    }

    [Bindable(event="propertyChange")]
    public function get hasSplitByTypes() : int
    {
        return _internal_hasSplitByTypes;
    }

    [Bindable(event="propertyChange")]
    public function get hierarchy() : Object
    {
        return _internal_hierarchy;
    }

    [Bindable(event="propertyChange")]
    public function get hasTimeSeries() : int
    {
        return _internal_hasTimeSeries;
    }

    [Bindable(event="propertyChange")]
    public function get comments() : String
    {
        return _internal_comments;
    }

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
    public function get shortName() : String
    {
        return _internal_shortName;
    }

    [Bindable(event="propertyChange")]
    public function get namen() : String
    {
        return _internal_namen;
    }

    [Bindable(event="propertyChange")]
    public function get Y2013() : Number
    {
        return _internal_Y2013;
    }

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
    public function get pwrTypeID() : int
    {
        return _internal_pwrTypeID;
    }

    [Bindable(event="propertyChange")]
    public function get indicatorID() : int
    {
        return _internal_indicatorID;
    }

    [Bindable(event="propertyChange")]
    public function get Y2015() : Number
    {
        return _internal_Y2015;
    }

    [Bindable(event="propertyChange")]
    public function get indiName() : String
    {
        return _internal_indiName;
    }

    [Bindable(event="propertyChange")]
    public function get Y2014() : Number
    {
        return _internal_Y2014;
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
    public function get Y2011() : Number
    {
        return _internal_Y2011;
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
    public function get scenarioID() : int
    {
        return _internal_scenarioID;
    }

    [Bindable(event="propertyChange")]
    public function get Y2009() : Number
    {
        return _internal_Y2009;
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

    public function set unit(value:Object) : void
    {
        var oldValue:Object = _internal_unit;
        if (oldValue !== value)
        {
            _internal_unit = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "unit", oldValue, _internal_unit));
        }
    }

    public function set isOutputIndicator(value:int) : void
    {
        var oldValue:int = _internal_isOutputIndicator;
        if (oldValue !== value)
        {
            _internal_isOutputIndicator = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "isOutputIndicator", oldValue, _internal_isOutputIndicator));
        }
    }

    public function set hasSplitByDevices(value:int) : void
    {
        var oldValue:int = _internal_hasSplitByDevices;
        if (oldValue !== value)
        {
            _internal_hasSplitByDevices = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "hasSplitByDevices", oldValue, _internal_hasSplitByDevices));
        }
    }

    public function set hasSplitByTypes(value:int) : void
    {
        var oldValue:int = _internal_hasSplitByTypes;
        if (oldValue !== value)
        {
            _internal_hasSplitByTypes = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "hasSplitByTypes", oldValue, _internal_hasSplitByTypes));
        }
    }

    public function set hierarchy(value:Object) : void
    {
        var oldValue:Object = _internal_hierarchy;
        if (oldValue !== value)
        {
            _internal_hierarchy = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "hierarchy", oldValue, _internal_hierarchy));
        }
    }

    public function set hasTimeSeries(value:int) : void
    {
        var oldValue:int = _internal_hasTimeSeries;
        if (oldValue !== value)
        {
            _internal_hasTimeSeries = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "hasTimeSeries", oldValue, _internal_hasTimeSeries));
        }
    }

    public function set comments(value:String) : void
    {
        var oldValue:String = _internal_comments;
        if (oldValue !== value)
        {
            _internal_comments = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "comments", oldValue, _internal_comments));
        }
    }

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

    public function set shortName(value:String) : void
    {
        var oldValue:String = _internal_shortName;
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

    public function set Y2013(value:Number) : void
    {
        var oldValue:Number = _internal_Y2013;
        if (isNaN(_internal_Y2013) == true || Math.abs(oldValue - value) > epsilon)
        {
            _internal_Y2013 = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Y2013", oldValue, _internal_Y2013));
        }
    }

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

    public function set pwrTypeID(value:int) : void
    {
        var oldValue:int = _internal_pwrTypeID;
        if (oldValue !== value)
        {
            _internal_pwrTypeID = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "pwrTypeID", oldValue, _internal_pwrTypeID));
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

    public function set Y2015(value:Number) : void
    {
        var oldValue:Number = _internal_Y2015;
        if (isNaN(_internal_Y2015) == true || Math.abs(oldValue - value) > epsilon)
        {
            _internal_Y2015 = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Y2015", oldValue, _internal_Y2015));
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

    public function set Y2014(value:Number) : void
    {
        var oldValue:Number = _internal_Y2014;
        if (isNaN(_internal_Y2014) == true || Math.abs(oldValue - value) > epsilon)
        {
            _internal_Y2014 = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Y2014", oldValue, _internal_Y2014));
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

    public function set Y2011(value:Number) : void
    {
        var oldValue:Number = _internal_Y2011;
        if (isNaN(_internal_Y2011) == true || Math.abs(oldValue - value) > epsilon)
        {
            _internal_Y2011 = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Y2011", oldValue, _internal_Y2011));
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

    model_internal function setterListenerUnit(value:flash.events.Event):void
    {
        _model.invalidateDependentOnUnit();
    }

    model_internal function setterListenerHierarchy(value:flash.events.Event):void
    {
        _model.invalidateDependentOnHierarchy();
    }

    model_internal function setterListenerComments(value:flash.events.Event):void
    {
        _model.invalidateDependentOnComments();
    }

    model_internal function setterListenerShortName(value:flash.events.Event):void
    {
        _model.invalidateDependentOnShortName();
    }

    model_internal function setterListenerNamen(value:flash.events.Event):void
    {
        _model.invalidateDependentOnNamen();
    }

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
        if (!_model.unitIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_unitValidationFailureMessages);
        }
        if (!_model.hierarchyIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_hierarchyValidationFailureMessages);
        }
        if (!_model.commentsIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_commentsValidationFailureMessages);
        }
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
    public function get _model() : _AEntityMetadata
    {
        return model_internal::_dminternal_model;
    }

    public function set _model(value : _AEntityMetadata) : void
    {
        var oldValue : _AEntityMetadata = model_internal::_dminternal_model;
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

    model_internal var _doValidationCacheOfUnit : Array = null;
    model_internal var _doValidationLastValOfUnit : Object;

    model_internal function _doValidationForUnit(valueIn:Object):Array
    {
        var value : Object = valueIn as Object;

        if (model_internal::_doValidationCacheOfUnit != null && model_internal::_doValidationLastValOfUnit == value)
           return model_internal::_doValidationCacheOfUnit ;

        _model.model_internal::_unitIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isUnitAvailable && _internal_unit == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "unit is required"));
        }

        model_internal::_doValidationCacheOfUnit = validationFailures;
        model_internal::_doValidationLastValOfUnit = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfHierarchy : Array = null;
    model_internal var _doValidationLastValOfHierarchy : Object;

    model_internal function _doValidationForHierarchy(valueIn:Object):Array
    {
        var value : Object = valueIn as Object;

        if (model_internal::_doValidationCacheOfHierarchy != null && model_internal::_doValidationLastValOfHierarchy == value)
           return model_internal::_doValidationCacheOfHierarchy ;

        _model.model_internal::_hierarchyIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isHierarchyAvailable && _internal_hierarchy == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "hierarchy is required"));
        }

        model_internal::_doValidationCacheOfHierarchy = validationFailures;
        model_internal::_doValidationLastValOfHierarchy = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfComments : Array = null;
    model_internal var _doValidationLastValOfComments : String;

    model_internal function _doValidationForComments(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfComments != null && model_internal::_doValidationLastValOfComments == value)
           return model_internal::_doValidationCacheOfComments ;

        _model.model_internal::_commentsIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isCommentsAvailable && _internal_comments == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "comments is required"));
        }

        model_internal::_doValidationCacheOfComments = validationFailures;
        model_internal::_doValidationLastValOfComments = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfShortName : Array = null;
    model_internal var _doValidationLastValOfShortName : String;

    model_internal function _doValidationForShortName(valueIn:Object):Array
    {
        var value : String = valueIn as String;

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
