namespace Quantum.Bell
{

  open Microsoft.Quantum.Primitive;
  open Microsoft.Quantum.Canon;

  operation Set (desired: Result, q1: Qubit) : ()
  {
    body
    {
      let current = M(q1);
      if (desired != current)
      {
        X(q1);
      }
    }
  }

  operation Bell (count: Int, initial: Result) : (Int, Int)
  {
    body
    {
      mutable numOnes = 0;
      using (qubits = Qubit[1])
      {
        for (test in 1..count)
        {
          Set (initial, quibits[0]);
          let res = M (quibits[0]);
          if (res == One)
          {
            set numOnes = numOnes + 1;
          }
        }
        Set (Zero, quibits[0]);
      }
      return (count-numOnes, numOnes) // (numZeros, numOnes)
    }
  }

}
