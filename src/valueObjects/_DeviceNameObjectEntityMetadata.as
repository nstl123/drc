
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
internal class _DeviceNameObjectEntityMetadata extends com.adobe.fiber.valueobjects.AbstractEntityMetadata
{
    private static var emptyArray:Array = new Array();

    model_internal static var allProperties:Array = new Array("id", "hierarchy", "namen", "comments");
    model_internal static var allAssociationProperties:Array = new Array();
    model_internal static var allRequiredProperties:Array = new Array("id", "hierarchy", "namen", "comments");
    model_internal static var allAlwaysAvailableProperties:Array = new Array("id", "hierarchy", "namen", "comments");
    model_internal static var guardedProperties:Array = new Array();
    model_internal static var dataProperties:Array = new Array("id", "hierarchy", "namen", "comments");
    model_internal static var derivedProperties:Array = new Array();
    model_internal static var collectionProperties:Array = new Array();
    model_internal static var collectionBaseMap:Object;
    model_internal static var entityName:String = "DeviceNameObject";
    model_internal static var dependentsOnMap:Object;
    model_internal static var dependedOnServices:Array = new Array();

    
    model_internal var _hierarchyIsValid:Boolean;
    model_internal var _hierarchyValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _hierarchyIsValidCacheInitialized:Boolean = false;
    model_internal var _hierarchyValidationFailureMessages:Array;
    
    model_internal var _namenIsValid:Boolean;
    model_internal var _namenValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _namenIsValidCacheInitialized:Boolean = false;
    model_internal var _namenValidationFailureMessages:Array;
    
    model_internal var _commentsIsValid:Boolean;
    model_internal var _commentsValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _commentsIsValidCacheInitialized:Boolean = false;
    model_internal var _commentsValidationFailureMessages:Array;

    model_internal var _instance:_Super_DeviceNameObject;
    model_internal static var _nullStyle:com.adobe.fiber.styles.Style = new com.adobe.fiber.styles.Style();

    public function _DeviceNameObjectEntityMetadata(value : _Super_DeviceNameObject)
    {
        // initialize property maps
        if (model_internal::dependentsOnMap == null)
        {
            // depenents map
            model_internal::dependentsOnMap = new Object();
            model_internal::dependentsOnMap["id"] = new Array();
            model_internal::dependentsOnMap["hierarchy"] = new Array();
            model_internal::dependentsOnMap["namen"] = new Array();
            model_internal::dependentsOnMap["comments"] = new Array();

            // collection base map
            model_internal::collectionBaseMap = new Object()
        }

        model_internal::_instance = value;
        model_internal::_hierarchyValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForHierarchy);
        model_internal::_hierarchyValidator.required = true;
        model_internal::_hierarchyValidator.requiredFieldError = "hierarchy is required";
        //model_internal::_hierarchyValidator.source = model_internal::_instance;
        //model_internal::_hierarchyValidator.property = "hierarchy";
        model_internal::_namenValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForNamen);
        model_internal::_namenValidator.required = true;
        model_internal::_namenValidator.requiredFieldError = "namen is required";
        //model_internal::_namenValidator.source = model_internal::_instance;
        //model_internal::_namenValidator.property = "namen";
        model_internal::_commentsValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForComments);
        model_internal::_commentsValidator.required = true;
        model_internal::_commentsValidator.requiredFieldError = "comments is required";
        //model_internal::_commentsValidator.source = model_internal::_instance;
        //model_internal::_commentsValidator.property = "comments";
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
            throw new Error(propertyName + " is not a data property of entity DeviceNameObject");  
            
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
            throw new Error(propertyName + " is not a collection property of entity DeviceNameObject");  

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
            throw new Error(propertyName + " does not exist for entity DeviceNameObject");
        }

        return model_internal::_instance[propertyName];
    }

    override public function setValue(propertyName:String, value:*):void
    {
        if (model_internal::dataProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " is not a data property of entity DeviceNameObject");
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
            throw new Error(propertyName + " does not exist for entity DeviceNameObject");
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
    public function get isIdAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isHierarchyAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isNamenAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isCommentsAvailable():Boolean
    {
        return true;
    }


    /**
     * derived property recalculation
     */
    public function invalidateDependentOnHierarchy():void
    {
        if (model_internal::_hierarchyIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfHierarchy = null;
            model_internal::calculateHierarchyIsValid();
        }
    }
    public function invalidateDependentOnNamen():void
    {
        if (model_internal::_namenIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfNamen = null;
            model_internal::calculateNamenIsValid();
        }
    }
    public function invalidateDependentOnComments():void
    {
        if (model_internal::_commentsIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfComments = null;
            model_internal::calculateCommentsIsValid();
        }
    }

    model_internal function fireChangeEvent(propertyName:String, oldValue:Object, newValue:Object):void
    {
        this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, propertyName, oldValue, newValue));
    }

    [Bindable(event="propertyChange")]   
    public function get idStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get hierarchyStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get hierarchyValidator() : StyleValidator
    {
        return model_internal::_hierarchyValidator;
    }

    model_internal function set _hierarchyIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_hierarchyIsValid;         
        if (oldValue !== value)
        {
            model_internal::_hierarchyIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "hierarchyIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get hierarchyIsValid():Boolean
    {
        if (!model_internal::_hierarchyIsValidCacheInitialized)
        {
            model_internal::calculateHierarchyIsValid();
        }

        return model_internal::_hierarchyIsValid;
    }

    model_internal function calculateHierarchyIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_hierarchyValidator.validate(model_internal::_instance.hierarchy)
        model_internal::_hierarchyIsValid_der = (valRes.results == null);
        model_internal::_hierarchyIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::hierarchyValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::hierarchyValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get hierarchyValidationFailureMessages():Array
    {
        if (model_internal::_hierarchyValidationFailureMessages == null)
            model_internal::calculateHierarchyIsValid();

        return _hierarchyValidationFailureMessages;
    }

    model_internal function set hierarchyValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_hierarchyValidationFailureMessages;

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
            model_internal::_hierarchyValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "hierarchyValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
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
    public function get commentsStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get commentsValidator() : StyleValidator
    {
        return model_internal::_commentsValidator;
    }

    model_internal function set _commentsIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_commentsIsValid;         
        if (oldValue !== value)
        {
            model_internal::_commentsIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "commentsIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get commentsIsValid():Boolean
    {
        if (!model_internal::_commentsIsValidCacheInitialized)
        {
            model_internal::calculateCommentsIsValid();
        }

        return model_internal::_commentsIsValid;
    }

    model_internal function calculateCommentsIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_commentsValidator.validate(model_internal::_instance.comments)
        model_internal::_commentsIsValid_der = (valRes.results == null);
        model_internal::_commentsIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::commentsValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::commentsValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get commentsValidationFailureMessages():Array
    {
        if (model_internal::_commentsValidationFailureMessages == null)
            model_internal::calculateCommentsIsValid();

        return _commentsValidationFailureMessages;
    }

    model_internal function set commentsValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_commentsValidationFailureMessages;

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
            model_internal::_commentsValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "commentsValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
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
            case("hierarchy"):
            {
                return hierarchyValidationFailureMessages;
            }
            case("namen"):
            {
                return namenValidationFailureMessages;
            }
            case("comments"):
            {
                return commentsValidationFailureMessages;
            }
            default:
            {
                return emptyArray;
            }
         }
     }

}

}
