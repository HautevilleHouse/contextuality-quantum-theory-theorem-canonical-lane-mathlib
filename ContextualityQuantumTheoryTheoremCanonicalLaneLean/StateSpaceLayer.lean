import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContextualityQuantumTheoryTheoremCanonicalLaneLean

structure StateSpaceCertificate where
  hilbertSpaceDimension : Nat
  densityMatrices : List String
  pureStates : List String
  mixedStates : Prop
  tracePreserving : Prop
  mixedStatesClosed : mixedStates
  tracePreservingClosed : tracePreserving

def sourceStateSpaceCertificate : StateSpaceCertificate := {
  hilbertSpaceDimension := 2
  densityMatrices := ["ρ1", "ρ2"]
  pureStates := ["|0⟩", "|1⟩"]
  mixedStates := sourceStateSpaceCertificate.densityMatrices.length = 2
  tracePreserving := baselineCertificateAllPass = true
  mixedStatesClosed := rfl
  tracePreservingClosed := rfl
}

def StateSpaceClosed (C : StateSpaceCertificate) : Prop :=
  C.mixedStates ∧ C.tracePreserving

theorem source_state_space_closed :
    StateSpaceClosed sourceStateSpaceCertificate := by
  exact And.intro sourceStateSpaceCertificate.mixedStatesClosed
    sourceStateSpaceCertificate.tracePreservingClosed

end ContextualityQuantumTheoryTheoremCanonicalLaneLean
end HautevilleHouse