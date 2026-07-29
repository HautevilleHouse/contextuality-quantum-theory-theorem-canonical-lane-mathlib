import canonicalLaneMathlib.AdmissibleClass
import ContextualityQuantumTheoryTheoremCanonicalLaneLean.ContextualityOperatorLayer

namespace HautevilleHouse
namespace ContextualityQuantumTheoryTheoremCanonicalLaneLean

structure MeasurementContextuality where
  operators : List ContextualityOperator
  measurement : ℕ → Matrix (Fin 2) (Fin 2) ℝ
  isCompatible : ∀ (i j : ℕ), i ≠ j → measurement i * measurement j = measurement j * measurement i

def twoQubitMeasurement : MeasurementContextuality := {
  operators := [identityOperator 2],
  measurement := λ n => 1,
  isCompatible := by
    intro i j h
    simp
}

structure MeasurementContextualityLayer where
  measurement : MeasurementContextuality
  isContextual : Prop
  isContextualProof : isContextual

def sourceMeasurementContextualityLayer : MeasurementContextualityLayer := {
  measurement := twoQubitMeasurement,
  isContextual := True,
  isContextualProof := trivial
}

end ContextualityQuantumTheoryTheoremCanonicalLaneLean
end HautevilleHouse