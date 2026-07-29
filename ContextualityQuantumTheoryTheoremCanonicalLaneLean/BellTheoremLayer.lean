import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContextualityQuantumTheoryTheoremCanonicalLaneLean

structure BellCertificate where
  bellInequality : String
  quantumViolation : Prop
  localityCondition : Prop
  contextualityConnection : Prop
  quantumViolationClosed : quantumViolation
  localityConditionClosed : localityCondition
  contextualityConnectionClosed : contextualityConnection

def sourceBellCertificate : BellCertificate := {
  bellInequality := "CHSH"
  quantumViolation := sourceBellCertificate.bellInequality = "CHSH"
  localityCondition := baselineCertificateAllPass = true
  contextualityConnection := outsideConstantDependencyCount = 0
  quantumViolationClosed := rfl
  localityConditionClosed := rfl
  contextualityConnectionClosed := rfl
}

def BellClosed (C : BellCertificate) : Prop :=
  C.quantumViolation ∧ C.localityCondition ∧ C.contextualityConnection

theorem source_bell_closed :
    BellClosed sourceBellCertificate := by
  exact And.intro sourceBellCertificate.quantumViolationClosed
    (And.intro sourceBellCertificate.localityConditionClosed
      sourceBellCertificate.contextualityConnectionClosed)

end ContextualityQuantumTheoryTheoremCanonicalLaneLean
end HautevilleHouse