import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace ContextualityQuantumTheoryTheoremCanonicalLaneLean

structure ContextualityOperator where
  dim : ℕ
  matrix : Matrix (Fin dim) (Fin dim) ℝ
  isHermitian : matrix = matrixᴴ
  hasLastEigenvalueNonzero : (matrix.eigenvalues).last ≠ 0

def identityOperator (n : ℕ) : ContextualityOperator := {
  dim := n,
  matrix := 1,
  isHermitian := by
    simp,
  hasLastEigenvalueNonzero := by
    simp
}

structure ContextualityOperatorLayer where
  operator : ContextualityOperator
  isContextual : Prop
  isContextualProof : isContextual

def sourceContextualityOperatorLayer : ContextualityOperatorLayer := {
  operator := identityOperator 2,
  isContextual := True,
  isContextualProof := trivial
}

end ContextualityQuantumTheoryTheoremCanonicalLaneLean
end HautevilleHouse