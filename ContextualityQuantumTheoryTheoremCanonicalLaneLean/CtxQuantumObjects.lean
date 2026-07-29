import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

/-!
# Contextuality Quantum Objects
This module defines quantum-theoretic objects: density matrices, observables, and contextuality scenarios.
-/

namespace HautevilleHouse
namespace ContextualityQuantumTheoryTheoremCanonicalLaneLean

abbrev HilbertSpace := Nat → ℂ
abbrev DensityMatrix := HilbertSpace → ℂ
abbrev Observable := DensityMatrix → ℝ
abbrev Context := Set Observable

structure CtxQuantumScenario where
  context : Context
  state : DensityMatrix
  measurementOutcomes : Observable → ℝ

def zeroDensity : DensityMatrix := fun _ => 0

def zeroObservable : Observable := fun _ => 0

def primitiveScenario : CtxQuantumScenario := {
  context := ∅
  state := zeroDensity
  measurementOutcomes := fun _ => 0
}

structure CtxQuantumOperators where
  expectation : Observable → DensityMatrix → ℝ
  commutator : Observable → Observable → Observable
  ctxProjection : Context → Context
  ctxProjectionIdempotent : ∀ C, ctxProjection (ctxProjection C) = ctxProjection C

def primitiveCtxQuantumOperators : CtxQuantumOperators := {
  expectation := fun _ _ => 0
  commutator := fun _ _ => zeroObservable
  ctxProjection := fun C => C
  ctxProjectionIdempotent := by intro C; rfl
}

def ContextualityClosed (S : CtxQuantumScenario) : Prop :=
  ∀ A ∈ S.context, S.measurementOutcomes A = 0

def CommutationClosed (O1 O2 : Observable) : Prop :=
  primitiveCtxQuantumOperators.commutator O1 O2 = zeroObservable

def CtxQuantumClosed (S : CtxQuantumScenario) : Prop :=
  ContextualityClosed S

end ContextualityQuantumTheoryTheoremCanonicalLaneLean
end HautevilleHouse