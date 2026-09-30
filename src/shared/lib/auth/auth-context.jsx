import { createContext, useContext, useState } from 'react';

// По умолчанию НЕ залогинен. Войти через кнопку "Войти" в шапке.
// Любой email + пароль от 4 символов = вход.
const Ctx = createContext();

export const AuthProvider = ({ children }) => {
  const [user, setUser] = useState(null);

  const login = (email) => setUser({
    name: 'Ернар Ибрагимов',
    role: 'Дизайнер',
    email: email || 'ernar@worktap.kz',
    avatar: 'https://i.pravatar.cc/100?img=12',
    balance: 250000,
  });

  const logout = () => setUser(null);

  return <Ctx.Provider value={{ user, login, logout }}>{children}</Ctx.Provider>;
};

export const useAuth = () => useContext(Ctx);
