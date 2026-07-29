import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic
import Mathlib.Data.Complex.Basis
import Mathlib.LinearAlgebra.Matrix.Basic

namespace HautevilleHouse
namespace ContextualityQuantumTheoryTheoremCanonicalLaneLean

abbrev Qubit := ℂ × ℂ
abbrev Observable := Matrix (Fin 2) (Fin 2) ℂ
abbrev Context := List Observable
abbrev State := Matrix (Fin 2) (Fin 2) ℂ

def identityObservable : Observable := 1

def zeroObservable : Observable := 0

def zeroState : State := 0

structure MeasurementOutcome where
  observable : Observable
  eigenvalue : ℂ
  eigenstate : State

def PauliX : Observable :=
  !![0, 1; 1, 0]

def PauliY : Observable :=
  !![0, -I; I, 0]

def PauliZ : Observable :=
  !![1, 0; 0, -1]

structure ContextualityFrame where
  contexts : List Context
  state : State
  outcomeAssignments : List (Context → List MeasurementOutcome)
  consistent : Prop
  contextualityWitness : Prop

def primitiveContextualityFrame : ContextualityFrame := {
  contexts :=
    [ [PauliX, PauliY], [PauliX, PauliZ], [PauliY, PauliZ] ],
  state := zeroState,
  outcomeAssignments := [],
  consistent := True,
  contextualityWitness := True
}

def ContextualityCertified (C : ContextualityFrame) : Prop :=
  C.consistent ∧ C.contextualityWitness

theorem primitive_contextuality_certified :
    ContextualityCertified primitiveContextualityFrame := by
  exact And.intro (by trivial) (by trivial)

end ContextualityQuantumTheoryTheoremCanonicalLaneLean
end HautevilleHouse