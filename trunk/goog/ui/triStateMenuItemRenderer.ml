(**
   OClosure Project - 2010

   Class goog.ui.TriStateMenuItemRenderer
   
   @author : Oran Charles
   @version 0.2
*)
open Js
open MenuItem

module TriStateMenuItemRenderer = struct

  (**
     CSS class name the renderer applies to menu item elements.
  *)
  let _CSS_CLASS = "goog-tristatemenuitem"

end

class type ['menuIt] triStateMenuItemRenderer = object
  inherit ['menuIt] menuItemRenderer

  (**
     Overrides goog.ui.ControlRenderer#decorate by initializing the
     menu item to checkable based on whether the element to be decorated has
     extra styling indicating that it should be.
     @param item Menu item instance to decorate the element.
     @param element Element to decorate.
     @return Decorated element.
  *)
  method decorate : 'menuIt t -> #Dom_html.element t -> Dom_html.element t meth

  (**
     Returns the CSS class to be applied to menu items rendered using this
     renderer.
     @return Renderer-specific CSS class.
  *)
  method getCssClass : js_string t meth

end

(**
   Default renderer for goog.ui.TriStateMenuItemRenderers. Each item has
   the following structure:
   <div class="goog-tristatemenuitem">
   <div class="goog-tristatemenuitem-checkbox"></div>
   <div>...(content)...</div>
   </div>
   @constructor
*)
let tmp = Js.Unsafe.variable "goog.ui.TriStateMenuItemRenderer"
let triStateMenuItemRenderer : #MenuItem.menuItem triStateMenuItemRenderer t 
    constr = tmp


