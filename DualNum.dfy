// action items:
    // write math class for sqrt _ pow
    // look into what complex conjugative is (function/method??/var in complex class) & how to use it in lemma 6
    // look into how to write proofs solving for certain variables in dafny

class Math
{
    function sqrt()
    {

    }

    function pow()
    {
        
    }
}

class DualNumbers
{
    // A.1 Dual Numbers

    var dual; // a_0
    var nondual; // a_e
    var dual_unit; // e

    // func: returns the dual conjugate (a_0 + e*a_e)
    function dual_conjugative() {
    return dual - (dual_unit * nondual);
    }

    // (A.1) lemma 6 - establishes dual conjugate behaves like the complex conjugate with respect to multiplication
    lemma multDualConjugate_lemma()
        // ensures  complex(conj(a) * conj(b)) == complex(conj(a)) * complex(conj(b))
            // **look into complex conjugative -> method/function??
    {
        // proof here
    }

    // (A.1) lemma 7 - inverse formula
    lemma inverse_lemma()
        requires dual != 0
    {
        // proof here
        // using equation 17 aka lemma 6
    }

    // function: returns the inverse of a dual number
    function dnInverse(): real
        requires dual != 0 // pure dual numbers (dual=0) do not have an inverse
        ensures inverse_lemma()
    {
        return (1/dual) - (dual_unit * (nondual / (dual * dual))); // = 1/(dual + dual_unit*nondual)
    }

    // (A.1) lemma 8 - sqrt formula
    lemma sqrt_lemma()
        requires dual > 0
    {
        var b := sqrt(dual);
        b_nondual; // ? no given value

        assert pow(b, 2) == dual;

        assert (2 * b * b_nondual) == nondual;
    }

    // function: returns the square root of a dual number
    function dnSqrt(): real
        requires dual > 0
        ensures sqrt_lemma()
    {
        return sqrt(dual) + (dual_unit * (nondual/(2 * sqrt(dual))));
    }
}