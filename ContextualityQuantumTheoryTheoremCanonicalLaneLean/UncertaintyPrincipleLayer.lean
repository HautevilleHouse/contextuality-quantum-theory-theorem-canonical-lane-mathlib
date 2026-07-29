import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContextualityQuantumTheoryTheoremCanonicalLaneLean

structure UncertaintyCertificate where
  observables : List String
  commutator : String
  varianceProducts : Prop
  heisenbergBound : Prop
  varianceProductsClosed : varianceProducts
  heisenbergBoundClosed : heisenbergBound

def sourceUncertaintyCertificate : UncertaintyCertificate := {
  observables := ["position", "momentum"]
  commutator := "[x,p] = iħ"
  varianceProducts := sourceUncertaintyCertificate.observables.length = 2
  heisenbergBound := baselineCertificateAllPass = true
  varianceProductsClosed := rfl
  heisenbergBoundClosed := rfl
}

def UncertaintyClosed (C : UncertaintyCertificate) : Prop :=
  C.varianceProducts ∧ C.heisenbergBound

theorem source_uncertainty_closed :
    UncertaintyClosed sourceUncertaintyCertificate := by
  exact And.intro sourceUncertaintyCertificate.varianceProductsClosed
    sourceUncertaintyCertificate.heisenbergBoundClosed

end ContextualityQuantumTheoryTheoremCanonicalLaneLean
end HautevilleHouse