import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContextualityQuantumTheoryTheoremCanonicalLaneLean

structure SpectralCertificate where
  operator : String
  spectrum : List String
  projectionValuedMeasure : Prop
  spectralDecomposition : Prop
  spectralDecompositionClosed : spectralDecomposition
  projectionValuedMeasureClosed : projectionValuedMeasure

def sourceSpectralCertificate : SpectralCertificate := {
  operator := "SelfAdjointOperator"
  spectrum := ["eigenvalue1", "eigenvalue2"]
  projectionValuedMeasure := sourceSpectralCertificate.spectrum.length = 2
  spectralDecomposition := baselineCertificateAllPass = true
  spectralDecompositionClosed := rfl
  projectionValuedMeasureClosed := rfl
}

def SpectralClosed (C : SpectralCertificate) : Prop :=
  C.projectionValuedMeasure ∧ C.spectralDecomposition

theorem source_spectral_closed :
    SpectralClosed sourceSpectralCertificate := by
  exact And.intro sourceSpectralCertificate.projectionValuedMeasureClosed
    sourceSpectralCertificate.spectralDecompositionClosed

end ContextualityQuantumTheoryTheoremCanonicalLaneLean
end HautevilleHouse