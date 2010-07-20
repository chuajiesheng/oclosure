(**
   OClosure Project - 2010
   Class goog.ui.Component
   
   Class that provides the basic implementation for disposable objects. 
   
   @author Cardoso Gabriel
   @version 0.1
*)
open Events
open Js

class type component = object
  inherit eventTarget

(**
   Adds the specified component as a child of this component at the given
   0-based index.

   Both [addChild] and [addChildAt] assume the following contract
   between parent and child components:
    <ul>
      <li>the child component's element must be a descendant of the parent
          component's element, and
      <li>the DOM state of the child component must be consistent with the DOM
          state of the parent component (see [isInDocument]).
    </ul>

   In particular, [parent.addChild(child)] will throw an error if the
   child component is already in the document, but the parent isn't.

   Clients of this API may call [addChild] and [addChildAt] with
   [opt_render] set to true.  If [opt_render] is true, calling these
   methods will automatically render the child component's element into the
   parent component's element.  However, [parent.addChild(child, true)]
   will throw an error if:
    <ul>
      <li>the parent component has no DOM (i.e. [parent.getElement()] is
          null), or
      <li>the child component is already in the document, regardless of the
          parent's DOM state.
    </ul>

   Finally, this method also throws an error if the new child already has a
   different parent, or the given index is out of bounds.

   @param child The new child component.
   @param index 0-based index at which the new child component is to be
      added; must be between 0 and the current child count (inclusive).
   @param opt_render If true, the child component will be rendered
      into the parent.
   @return
 *)
  (*method addChildAt : component t -> int -> bool t opt -> unit meth*)

(**
   Determines if a given element can be decorated by this type of component.
   This method should be overridden by inheriting objects.
   @param element Element to decorate.
   @return True if the element can be decorated, false otherwise.
 *)
  method canDecorate : #Dom_html.element t -> bool t meth

(**
   Creates the initial DOM representation for the component.  The default
   implementation is to set this.element_ = div.
 *)
  method createDom : unit meth

  (** Decorates the element for the UI component. *)
  method decorate : #Dom_html.element t -> unit meth

(**
   Disposes of the component.  Calls [exitDocument], which is expected to
   remove event handlers and clean up the component.  Propagates the call to
   the component's children, if any. Removes the component's DOM from the
   document unless it was decorated.
   @override
 *)
  method disposeInternal : unit meth

(**
   Called when the component's element is known to be in the document. Anything
   using document.getElementById etc. should be done at this stage.
   
   If the component contains child components, this call is propagated to its
   children.
*)
  method enterDocument : unit meth

(**
   Called by dispose to clean up the elements and listeners created by a
   component, or by a parent component/application who has removed the
   component from the document but wants to reuse it later.

   If the component contains child components, this call is propagated to its
   children.

   It should be possible for the component to be rendered again once this method
   has been called.
 *)
  method exitDocument : unit meth

  (** Returns the child with the given ID, or null if no such child exists. *)
  method getChild : js_string t -> component t opt meth

  (** Returns the child at the given index, or null if the index is out of 
     bounds. *) 
  method getChildAt : int -> component t opt meth  

(**
   Returns the number of children of this component.
   @return The number of children.
 *)
  method getChildCount : int meth

(**
   Returns an array containing the IDs of the children of this component, or an
   empty array if the component has no children.
   @return Child component IDs.
 *)
  method getChildIds : js_string t js_array t meth

(**
   Set is right-to-left. This function should be used if the component needs
   to know the rendering direction during dom creation (i.e. before
   #enterDocument is called and is right-to-left is set).
   @param rightToLeft Whether the component is rendered
       right-to-left.
 *)
  method getContentElement : Dom_html.element t meth

(**
   Set is right-to-left. This function should be used if the component needs
   to know the rendering direction during dom creation (i.e. before
   #enterDocument is called and is right-to-left is set).
   @param rightToLeft Whether the component is rendered
       right-to-left.
 *)
  method getDomHelper : Gdom.domHelper t meth

  (** Gets the component's element. *)
  method getElement : Dom_html.element t meth

(**
   Set is right-to-left. This function should be used if the component needs
   to know the rendering direction during dom creation (i.e. before
   #enterDocument is called and is right-to-left is set).
   @param rightToLeft Whether the component is rendered
       right-to-left.
 *)
  method getElementByFragment : js_string t -> Dom_html.element t meth

(**
   Set is right-to-left. This function should be used if the component needs
   to know the rendering direction during dom creation (i.e. before
   #enterDocument is called and is right-to-left is set).
   @param rightToLeft Whether the component is rendered
       right-to-left.
 *)
  method getFragmentFromId : js_string t -> js_string t meth

(**
   Gets the unique ID for the instance of this component.  If the instance
   doesn't already have an ID, generates one on the fly.
   @return Unique component ID.
 *)
  method getId : js_string t meth

  (** Returns the component's parent, if any. *)
  method getParent : component t opt meth

(**
   Set is right-to-left. This function should be used if the component needs
   to know the rendering direction during dom creation (i.e. before
   #enterDocument is called and is right-to-left is set).
   @param rightToLeft Whether the component is rendered
       right-to-left.
 *)
  method hasChildren : bool t meth

(**
   Set is right-to-left. This function should be used if the component needs
   to know the rendering direction during dom creation (i.e. before
   #enterDocument is called and is right-to-left is set).
   @param rightToLeft Whether the component is rendered
       right-to-left.
 *)
  method indexOfChild : component t opt -> int meth

(**
   Set is right-to-left. This function should be used if the component needs
   to know the rendering direction during dom creation (i.e. before
   #enterDocument is called and is right-to-left is set).
   @param rightToLeft Whether the component is rendered
       right-to-left.
 *)
  method isInDocument : bool t meth

(**
   Set is right-to-left. This function should be used if the component needs
   to know the rendering direction during dom creation (i.e. before
   #enterDocument is called and is right-to-left is set).
   @param rightToLeft Whether the component is rendered
       right-to-left.
 *)
  method isRightToLeft : bool t meth

(**
   Set is right-to-left. This function should be used if the component needs
   to know the rendering direction during dom creation (i.e. before
   #enterDocument is called and is right-to-left is set).
   @param rightToLeft Whether the component is rendered
       right-to-left.
 *)
  method makeId : js_string t -> js_string t meth

(**
   Set is right-to-left. This function should be used if the component needs
   to know the rendering direction during dom creation (i.e. before
   #enterDocument is called and is right-to-left is set).
   @param rightToLeft Whether the component is rendered
       right-to-left.
 *)
  (*method removeChild : (js_string t, component t) Tools.Union.t opt 
    -> bool t opt -> component t  meth*)

(**
   Set is right-to-left. This function should be used if the component needs
   to know the rendering direction during dom creation (i.e. before
   #enterDocument is called and is right-to-left is set).
   @param rightToLeft Whether the component is rendered
       right-to-left.
 *)
  method removeChildAt : int -> bool t opt -> component t meth

(**
   Set is right-to-left. This function should be used if the component needs
   to know the rendering direction during dom creation (i.e. before
   #enterDocument is called and is right-to-left is set).
   @param rightToLeft Whether the component is rendered
       right-to-left.
 *)
  method removeChildren : bool t opt -> unit meth

  (** 
     Renders the component. If a parent element is supplied, it should already
     be in the document and then the component's element will be appended to 
     it. If there is no optional parent element and the element doesn't have 
     a parentNode then it will be appended to the document body. Throws an 
     Error if the component is already rendered.
  *)
  method render : #Dom_html.element t opt -> unit meth

(**
   Set is right-to-left. This function should be used if the component needs
   to know the rendering direction during dom creation (i.e. before
   #enterDocument is called and is right-to-left is set).
   @param rightToLeft Whether the component is rendered
       right-to-left.
 *)
  method renderBefore : #Dom_html.element t -> unit meth

(**
   Assigns an ID to this component instance.  It is the caller's responsibility
   to guarantee that the ID is unique.  If the component is a child of a parent
   component, then the parent component's child index is updated to reflect the
   new ID; this may throw an error if the parent already has a child with an ID
   that conflicts with the new ID.
   @param id Unique component ID.
 *)
  method setId : js_string t -> unit meth

(**
   Sets the parent of this component to use for event bubbling.  Throws an error
   if the component already has a parent or if an attempt is made to add a
   component to itself as a child.  Callers must use [removeChild]
   or [removeChildAt] to remove components from their containers before
   calling this method.
   @param parent The parent component.
 *)
  method setParent : component t -> unit meth

(**
   Overrides goog.events.EventTarget#setParentEventTarget to throw an
   error if the parent component is set, and the argument is not the parent.

   @param parent Parent EventTarget (null if none).
 *)
  method setParentEventTarget : Events.eventTarget t opt -> unit meth

(**
   Set is right-to-left. This function should be used if the component needs
   to know the rendering direction during dom creation (i.e. before
   #enterDocument is called and is right-to-left is set).
   @param rightToLeft Whether the component is rendered
       right-to-left.
 *)
  method setRightToLeft : bool t -> unit meth

(**
   @return Whether the component was decorated.
 *)
  method wasDecorated : bool t meth
end


(**
   Default implementation of UI component.

   @param opt_domHelper Optional DOM helper.
 *)
val component : Gdom.domHelper t opt -> component t constr

module Component : sig
  val addChild : #component t -> #component t -> bool t opt -> unit 

  module State : sig
    type state = 	
	ALL | DISABLED | HOVER | ACTIVE | SELECTED | CHECKED | FOCUSED | OPENED
    type state_pre
    val state_of_state_pre : state_pre -> state
    val state_pre_of_state : state -> state_pre
  end 

(**
   Common events fired by components so that event propagation is useful.  Not
   all components are expected to dispatch or listen for all event types.
   Events dispatched before a state transition should be cancelable to prevent
   the corresponding state change.
   @enum string
*)
  module EventType : sig
     (** Dispatched before the component becomes visible. *)
    val _BEFORE_SHOW : js_string t
     (**
	Dispatched after the component becomes visible.
	NOTE(user): For goog.ui.Container, this actually fires before containers
	are shown.  Use goog.ui.Container.EventType.AFTER_SHOW if you want an event
	that fires after a goog.ui.Container is shown.
     *)
    val _SHOW : js_string t

  (** Dispatched before the component becomes hidden. *)
    val _HIDE : js_string t
	
  (** Dispatched before the component becomes disabled. *)
    val _DISABLE : js_string t
	
  (** Dispatched before the component becomes enabled. *)
    val _ENABLE : js_string t
	
  (** Dispatched before the component becomes highlighted. *)
    val _HIGHLIGHT : js_string t
	
  (** Dispatched before the component becomes un-highlighted. *)
    val _UNHIGHLIGHT : js_string t
	
  (** Dispatched before the component becomes activated. *)
    val _ACTIVATE : js_string t
	
  (** Dispatched before the component becomes deactivated. *)
    val _DEACTIVATE : js_string t
	
  (** Dispatched before the component becomes selected. *)
    val _SELECT : js_string t
	
  (** Dispatched before the component becomes un-selected. *)
    val _UNSELECT : js_string t
	
  (** Dispatched before a component becomes checked. *)
    val _CHECK : js_string t
	
  (** Dispatched before a component becomes un-checked. *)
    val _UNCHECK : js_string t
	
  (** Dispatched before a component becomes focused. *)
    val _FOCUS : js_string t
	
  (** Dispatched before a component becomes blurred. *)
    val _BLUR : js_string t
	
  (** Dispatched before a component is opened (expanded). *)
    val _OPEN : js_string t
	
  (** Dispatched before a component is closed (collapsed). *)
    val _CLOSE : js_string t
	
  (** Dispatched after a component is moused over. *)
    val _ENTER : js_string t
	
  (** Dispatched after a component is moused out of. *)
    val _LEAVE : js_string t
	
  (** Dispatched after the user activates the component. *)
    val _ACTION : js_string t
	
  (** Dispatched after the external-facing state of a component is changed. *)
    val _CHANGE : js_string t
  end
end