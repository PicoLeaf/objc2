use std::fmt;

use Encoding;

pub trait Encodings {
    fn eq<C: EncodingsComparator>(&self, C) -> bool;

    fn encoding_at_eq<T: ?Sized + Encoding>(&self, u8, &T) -> bool;

    fn len(&self) -> u8;

    fn write_all<W: fmt::Write>(&self, &mut W) -> fmt::Result;
}

macro_rules! count_idents {
    () => (0);
    ($a:ident) => (1);
    ($a:ident, $($b:ident),+) => (1 + count_idents!($($b),*));
}

macro_rules! fmt_repeat {
    () => ("");
    ($a:ident) => ("{}");
    ($a:ident, $($b:ident),+) => (concat!("{}", fmt_repeat!($($b),*)));
}

macro_rules! encodings_impl {
    ($($i:expr => $a:ident : $t:ident),*) => (
        #[allow(unused)]
        impl<$($t: Encoding),*> Encodings for ($($t,)*) {
            fn eq<X: EncodingsComparator>(&self, mut fields: X) -> bool {
                let ($(ref $a,)*) = *self;
                $(fields.eq_next($a) &&)* fields.is_finished()
            }

            fn write_all<W: fmt::Write>(&self, formatter: &mut W) -> fmt::Result {
                let ($(ref $a,)*) = *self;
                write!(formatter, fmt_repeat!($($t),*), $($a),*)
            }

            fn encoding_at_eq<T: ?Sized + Encoding>(&self, index: u8, other: &T) -> bool {
                let ($(ref $a,)*) = *self;
                match index {
                    $($i => $a.eq_encoding(other),)*
                    _ => false,
                }
            }

            fn len(&self) -> u8 { count_idents!($($t),*) }
        }
    );
}

encodings_impl!();
encodings_impl!(0 => a: A);
encodings_impl!(0 => a: A, 1 => b: B);
encodings_impl!(0 => a: A, 1 => b: B, 2 => c: C);
encodings_impl!(0 => a: A, 1 => b: B, 2 => c: C, 3 => d: D);

pub trait EncodingsComparator {
    fn eq_next<T: ?Sized + Encoding>(&mut self, &T) -> bool;
    fn is_finished(&self) -> bool;
}

pub struct EncodingTupleComparator<'a, T> where T: 'a + Encodings {
    encs: &'a T,
    index: u8,
}

impl<'a, T> EncodingTupleComparator<'a, T> where T: 'a + Encodings {
    pub fn new(encs: &'a T) -> EncodingTupleComparator<'a, T> {
        EncodingTupleComparator { encs: encs, index: 0 }
    }
}

impl<'a, T> EncodingsComparator for EncodingTupleComparator<'a, T>
        where T: 'a + Encodings {
    fn eq_next<E: ?Sized + Encoding>(&mut self, other: &E) -> bool {
        let index = self.index;
        if index < self.encs.len() {
            self.index += 1;
            self.encs.encoding_at_eq(index, other)
        } else {
            false
        }
    }

    fn is_finished(&self) -> bool {
        self.index >= self.encs.len()
    }
}
