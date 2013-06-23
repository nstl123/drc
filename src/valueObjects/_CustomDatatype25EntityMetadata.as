
/**
 * This is a generated class and is not intended for modification.  
 */
package valueObjects
{
import com.adobe.fiber.styles.IStyle;
import com.adobe.fiber.styles.Style;
import com.adobe.fiber.styles.StyleValidator;
import com.adobe.fiber.valueobjects.AbstractEntityMetadata;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import mx.events.ValidationResultEvent;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IModelType;
import mx.events.PropertyChangeEvent;

use namespace model_internal;

[ExcludeClass]
internal class _CustomDatatype25EntityMetadata extends com.adobe.fiber.valueobjects.AbstractEntityMetadata
{
    private static var emptyArray:Array = new Array();

    model_internal static var allProperties:Array = new Array("Y2013", "indicatorID", "Y2012", "Y2015", "Y2014", "Y2017", "Y2008", "Y2016", "Y2007", "Y2019", "countryID", "Y2006", "Y2018", "deviceID", "Y2021", "Y2020", "Y2011", "Y2010", "scenarioID", "Y2009", "namen", "typeID");
    model_internal static var allAssociationProperties:Array = new Array();
    model_internal static var allRequiredProperties:Array = new Array("Y2013", "indicatorID", "Y2012", "Y2015", "Y2014", "Y2017", "Y2008", "Y2016", "Y2007", "Y2019", "countryID", "Y2006", "Y2018", "deviceID", "Y2021", "Y2020", "Y2011", "Y2010", "scenarioID", "Y2009", "namen", "typeID");
    model_internal static var allAlwaysAvailableProperties:Array = new Array("Y2013", "indicatorID", "Y2012", "Y2015", "Y2014", "Y2017", "Y2008", "Y2016", "Y2007", "Y2019", "countryID", "Y2006", "Y2018", "deviceID", "Y2021", "Y2020", "Y2011", "Y2010", "scenarioID", "Y2009", "namen", "typeID");
    model_internal static var guardedProperties:Array = new Array();
    model_internal static var dataProperties:Array = new Array("Y2013", "indicatorID", "Y2012", "Y2015", "Y2014", "Y2017", "Y2008", "Y2016", "Y2007", "Y2019", "countryID", "Y2006", "Y2018", "deviceID", "Y2021", "Y2020", "Y2011", "Y2010", "scenarioID", "Y2009", "namen", "typeID");
    model_internal static var derivedProperties:Array = new Array();
    model_internal static var collectionProperties:Array = new Array();
    model_internal static var collectionBaseMap:Object;
    model_internal static var entityName:String = "CustomDatatype25";
    model_internal static var dependentsOnMap:Object;
    model_internal static var dependedOnServices:Array = new Array();

    
    model_internal var _namenIsValid:Boolean;
    model_internal var _namenValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _namenIsValidCacheInitialized:Boolean = false;
    model_internal var _namenValidationFailureMessages:Array;

    model_internal var _instance:_Super_CustomDatatype25;
    model_internal static var _nullStyle:com.adobe.fiber.styles.Style = new com.adobe.fiber.styles.Style();

    public function _CustomDatatype25EntityMetadata(value : _Super_CustomDatatype25)
    {
        // initialize property maps
        if (model_internal::dependentsOnMap == null)
        {
            // depenents map
            model_internal::dependentsOnMap = new Object();
            model_internal::dependentsOnMap["Y2013"] = new Array();
            model_internal::dependentsOnMap["indicatorID"] = new Array();
            model_internal::dependentsOnMap["Y2012"] = new Array();
            model_internal::dependentsOnMap["Y2015"] = new Array();
            model_internal::dependentsOnMap["Y2014"] = new Array();
            model_internal::dependentsOnMap["Y2017"] = new Array();
            model_internal::dependentsOnMap["Y2008"] = new Array();
            model_internal::dependentsOnMap["Y2016"] = new Array();
            model_internal::dependentsOnMap["Y2007"] = new Array();
            model_internal::dependentsOnMap["Y2019"] = new Array();
            model_internal::dependentsOnMap["countryID"] = new Array();
            model_internal::dependentsOnMap["Y2006"] = new Array();
            model_internal::dependentsOnMap["Y2018"] = new Array();
            model_internal::dependentsOnMap["deviceID"] = new Array();
            model_internal::dependentsOnMap["Y2021"] = new Array();
            model_internal::dependentsOnMap["Y2020"] = new Array();
            model_internal::dependentsOnMap["Y2011"] = new Array();
            model_internal::dependentsOnMap["Y2010"] = new Array();
            model_internal::dependentsOnMap["scenarioID"] = new Array();
            model_internal::dependentsOnMap["Y2009"] = new Array();
            model_internal::dependentsOnMap["namen"] = new Array();
            model_internal::dependentsOnMap["typeID"] = new Array();

            // collection base map
            model_internal::collectionBaseMap = new Object()
        }

        model_internal::_instance = value;
        model_internal::_namenValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForNamen);
        model_internal::_namenValidator.required = true;
        model_internal::_namenValidator.requiredFieldError = "namen is required";
        //model_internal::_namenValidator.source = model_internal::_instance;
        //model_internal::_namenValidator.property = "namen";
    }

    override public function getEntityName():String
    {
        return model_internal::entityName;
    }

    override public function getProperties():Array
    {
        return model_internal::allProperties;
    }

    override public function getAssociationProperties():Array
    {
        return model_internal::allAssociationProperties;
    }

    override public function getRequiredProperties():Array
    {
         return model_internal::allRequiredProperties;   
    }

    override public function getDataProperties():Array
    {
        return model_internal::dataProperties;
    }

    override public function getGuardedProperties():Array
    {
        return model_internal::guardedProperties;
    }

    override public function getUnguardedProperties():Array
    {
        return model_internal::allAlwaysAvailableProperties;
    }

    override public function getDependants(propertyName:String):Array
    {
       if (model_internal::dataProperties.indexOf(propertyName) == -1)
            throw new Error(propertyName + " is not a data property of entity CustomDatatype25");  
            
       return model_internal::dependentsOnMap[propertyName] as Array;  
    }

    override public function getDependedOnServices():Array
    {
        return model_internal::dependedOnServices;
    }

    override public function getCollectionProperties():Array
    {
        return model_internal::collectionProperties;
    }

    override public function getCollectionBase(propertyName:String):String
    {
        if (model_internal::collectionProperties.indexOf(propertyName) == -1)
            throw new Error(propertyName + " is not a collection property of entity CustomDatatype25");  

        return model_internal::collectionBaseMap[propertyName];
    }

    override public function getAvailableProperties():com.adobe.fiber.valueobjects.IPropertyIterator
    {
        return new com.adobe.fiber.valueobjects.AvailablePropertyIterator(this);
    }

    override public function getValue(propertyName:String):*
    {
        if (model_internal::allProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " does not exist for entity CustomDatatype25");
        }

        return model_internal::_instance[propertyName];
    }

    override public function setValue(propertyName:String, value:*):void
    {
        if (model_internal::dataProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " is not a data property of entity CustomDatatype25");
        }

        model_internal::_instance[propertyName] = value;
    }

    override public function getMappedByProperty(associationProperty:String):String
    {
        switch(associationProperty)
        {
            default:
            {
                return null;
            }
        }
    }

    override public function getPropertyLength(propertyName:String):int
    {
        switch(propertyName)
        {
            default:
            {
                return 0;
            }
        }
    }

    override public function isAvailable(propertyName:String):Boolean
    {
        if (model_internal::allProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " does not exist for entity CustomDatatype25");
        }

        if (model_internal::allAlwaysAvailableProperties.indexOf(propertyName) != -1)
        {
            return true;
        }

        switch(propertyName)
        {
            default:
            {
                return true;
            }
        }
    }

    override public function getIdentityMap():Object
    {
        var returnMap:Object = new Object();

        return returnMap;
    }

    [Bindable(event="propertyChange")]
    override public function get invalidConstraints():Array
    {
        if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
        {
            return model_internal::_instance.model_internal::_invalidConstraints;
        }
        else
        {
            // recalculate isValid
            model_internal::_instance.model_internal::_isValid = model_internal::_instance.model_internal::calculateIsValid();
            return model_internal::_instance.model_internal::_invalidConstraints;        
        }
    }

    [Bindable(event="propertyChange")]
    override public function get validationFailureMessages():Array
    {
        if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
        {
            return model_internal::_instance.model_internal::_validationFailureMessages;
        }
        else
        {
            // recalculate isValid
            model_internal::_instance.model_internal::_isValid = model_internal::_instance.model_internal::calculateIsValid();
            return model_internal::_instance.model_internal::_validationFailureMessages;
        }
    }

    override public function getDependantInvalidConstraints(propertyName:String):Array
    {
        var dependants:Array = getDependants(propertyName);
        if (dependants.length == 0)
        {
            return emptyArray;
        }

        var currentlyInvalid:Array = invalidConstraints;
        if (currentlyInvalid.length == 0)
        {
            return emptyArray;
        }

        var filterFunc:Function = function(element:*, index:int, arr:Array):Boolean
        {
            return dependants.indexOf(element) > -1;
        }

        return currentlyInvalid.filter(filterFunc);
    }

    /**
     * isValid
     */
    [Bindable(event="propertyChange")] 
    public function get isValid() : Boolean
    {
        if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
        {
            return model_internal::_instance.model_internal::_isValid;
        }
        else
        {
            // recalculate isValid
            model_internal::_instance.model_internal::_isValid = model_internal::_instance.model_internal::calculateIsValid();
            return model_internal::_instance.model_internal::_isValid;
        }
    }

    [Bindable(event="propertyChange")]
    public function get isY2013Available():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isIndicatorIDAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isY2012Available():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isY2015Available():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isY2014Available():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isY2017Available():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isY2008Available():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isY2016Available():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isY2007Available():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isY2019Available():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isCountryIDAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isY2006Available():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isY2018Available():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isDeviceIDAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isY2021Available():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isY2020Available():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isY2011Available():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isY2010Available():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isScenarioIDAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isY2009Available():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isNamenAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isTypeIDAvailable():Boolean
    {
        return true;
    }


    /**
     * derived property recalculation
     */
    public function invalidateDependentOnNamen():void
    {
        if (model_internal::_namenIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfNamen = null;
            model_internal::calculateNamenIsValid();
        }
    }

    model_internal function fireChangeEvent(propertyName:String, oldValue:Object, newValue:Object):void
    {
        this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, propertyName, oldValue, newValue));
    }

    [Bindable(event="propertyChange")]   
    public function get Y2013Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get indicatorIDStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get Y2012Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get Y2015Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get Y2014Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get Y2017Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get Y2008Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get Y2016Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get Y2007Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get Y2019Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get countryIDStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get Y2006Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get Y2018Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get deviceIDStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get Y2021Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get Y2020Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get Y2011Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get Y2010Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get scenarioIDStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get Y2009Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get namenStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get namenValidator() : StyleValidator
    {
        return model_internal::_namenValidator;
    }

    model_internal function set _namenIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_namenIsValid;         
        if (oldValue !== value)
        {
            model_internal::_namenIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "namenIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get namenIsValid():Boolean
    {
        if (!model_internal::_namenIsValidCacheInitialized)
        {
            model_internal::calculateNamenIsValid();
        }

        return model_internal::_namenIsValid;
    }

    model_internal function calculateNamenIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_namenValidator.validate(model_internal::_instance.namen)
        model_internal::_namenIsValid_der = (valRes.results == null);
        model_internal::_namenIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::namenValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::namenValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get namenValidationFailureMessages():Array
    {
        if (model_internal::_namenValidationFailureMessages == null)
            model_internal::calculateNamenIsValid();

        return _namenValidationFailureMessages;
    }

    model_internal function set namenValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_namenValidationFailureMessages;

        var needUpdate : Boolean = false;
        if (oldValue == null)
            needUpdate = true;
    
        // avoid firing the event when old and new value are different empty arrays
        if (!needUpdate && (oldValue !== value && (oldValue.length > 0 || value.length > 0)))
        {
            if (oldValue.length == value.length)
            {
                for (var a:int=0; a < oldValue.length; a++)
                {
                    if (oldValue[a] !== value[a])
                    {
                        needUpdate = true;
                        break;
                    }
                }
            }
            else
            {
                needUpdate = true;
            }
        }

        if (needUpdate)
        {
            model_internal::_namenValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "namenValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get typeIDStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }


     /**
     * 
     * @inheritDoc 
     */ 
     override public function getStyle(propertyName:String):com.adobe.fiber.styles.IStyle
     {
         switch(propertyName)
         {
            default:
            {
                return null;
            }
         }
     }
     
     /**
     * 
     * @inheritDoc 
     *  
     */  
     override public function getPropertyValidationFailureMessages(propertyName:String):Array
     {
         switch(propertyName)
         {
            case("namen"):
            {
                return namenValidationFailureMessages;
            }
            default:
            {
                return emptyArray;
            }
         }
     }

}

}
