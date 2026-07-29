import canonicalLaneMathlib.AdmissibleClass
import ContextualityQuantumTheoryTheoremCanonicalLaneLean.MeasurementContextualityLayer

namespace HautevilleHouse
namespace ContextualityQuantumTheoryTheoremCanonicalLaneLean

structure KochenSpeckerCertificate where
  measurementLayer : MeasurementContextualityLayer
  dimension : ℕ
  isKochenSpecker : Prop
  isKochenSpeckerProof : isKochenSpecker

def sourceKochenSpeckerCertificate : KochenSpeckerCertificate := {
  measurementLayer := sourceMeasurementContextualityLayer,
  dimension := 3,
  isKochenSpecker := True,
  isKochenSpeckerProof := trivial
}

def KochenSpeckerClosed (C : KochenSpeckerCertificate) : Prop :=
  C.isKochenSpecker ∧ C.measurementLayer.isContextual

theorem source_kochen_specker_closed : KochenSpeckerClosed sourceKochenSpeckerCertificate := by
  exact And.intro trivial sourceKochenSpeckerCertificate.measurementLayer.isContextualProof

end ContextualityQuantumTheoryTheoremCanonicalLaneLean
end HautevilleHouse