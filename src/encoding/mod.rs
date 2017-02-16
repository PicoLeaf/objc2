mod array;
mod never;
mod pointer;
mod primitive;
mod structure;
mod union;

use core::fmt;

use multi::Encodings;

pub use self::array::Array;
pub use self::pointer::Pointer;
pub use self::primitive::Primitive;
pub use self::structure::Struct;
pub use self::union::Union;

pub trait Encoding: fmt::Display {
    type PointerTarget: ?Sized + Encoding;
    type ArrayItem: ?Sized + Encoding;
    type StructFields: ?Sized + Encodings;
    type UnionMembers: ?Sized + Encodings;

    fn descriptor(&self) -> Descriptor<Self::PointerTarget,
                                       Self::ArrayItem,
                                       Self::StructFields,
                                       Self::UnionMembers>;

    fn eq_encoding<T: ?Sized + Encoding>(&self, &T) -> bool;
}

#[derive(Clone, Copy, Debug)]
pub enum Descriptor<'a, T, I, F, M>
        where T: 'a + ?Sized + Encoding,
              I: 'a + ?Sized + Encoding,
              F: 'a + ?Sized + Encodings,
              M: 'a + ?Sized + Encodings {
    Primitive(Primitive),
    Pointer(&'a T),
    Array(u32, &'a I),
    Struct(&'a str, &'a F),
    Union(&'a str, &'a M),
}
