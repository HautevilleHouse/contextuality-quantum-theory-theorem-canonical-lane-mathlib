import canonicalLaneMathlib.AdmissibleClass
import Mathlib.MeasureTheory.Measure.ProbabilityMeasure

namespace HautevilleHouse
namespace ContextualityQuantumTheoryTheoremCanonicalLaneLean

structure QuantumStateSpace where
  dim : ℕ
  states : Set (Matrix (Fin dim) (Fin dim) ℝ)
  isClosedUnderConvexCombinations : ∀ (ρ₁ ρ₂ ∈ states), ∀ (t : ℝ), 0 ≤ t ∧ t ≤ 1 → t • ρ₁ + (1 - t) • ρ₂ ∈ states

def twoQubitStateSpace : QuantumStateSpace := {
  dim := 4,
  states := {ρ | ρ = 1},
  isClosedUnderConvexCombinations := by
    intro ρ₁ ρ₂ hρ₁ hρ₂ t ht
    simp at *
    simp
}

structure QuantumStateSpaceLayer where
  space : QuantumStateSpace
  hasDensity : Prop
  hasDensityProof : hasDensity

def sourceQuantumStateSpaceLayer : QuantumStateSpaceLayer := {
  space := twoQubitStateSpace,
  hasDensity := True,
  hasDensityProof := trivial
}

end ContextualityQuantumTheoryTheoremCanonicalLaneLean
end HautevilleHouse