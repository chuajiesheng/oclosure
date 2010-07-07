(** 
   OClosure Project - 2010
   Class goog.ui.ToolbarButton
   
   @author Cardoso Gabriel
   @version 0.2
*)
open Button

open Js
class type toolbarButton = object
  inherit button
end

val toolbarButton : (ControlContent.controlContent -> Button.buttonRenderer t opt -> Gdom.domHelper t opt -> toolbarButton t) constr 
